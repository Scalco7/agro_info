import 'dart:math';

import 'package:agro_info/app/common/providers/plague_provider.dart';
import 'package:agro_info/app/pages/plague/widgets/plague_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PlagueList extends StatefulWidget {
  final String searchTerm;
  const PlagueList({super.key, this.searchTerm = ""});

  @override
  State<PlagueList> createState() => _PlagueListState();
}

class _PlagueListState extends State<PlagueList> {
  final ScrollController _scrollController = ScrollController();
  final double maxExtentGrid = 210;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PlagueProvider>(
        builder: (_, plagueProvider, widget) {
          if (plagueProvider.plagues == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Lottie.asset(
                  "assets/animations/inchworm_animation.json",
                  fit: BoxFit.contain,
                  alignment: AlignmentGeometry.center,
                  repeat: true,
                  width: 200,
                ),
                Text(
                  "Carregando...",
                  style: TextStyle(fontWeight: FontWeight(500), fontSize: 16),
                ),
              ],
            );
          } else if (plagueProvider.plagues!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "Nenhuma praga encontrada!",
                  style: TextStyle(fontWeight: FontWeight(500), fontSize: 16),
                ),
                if (plagueProvider.searchController.text.isNotEmpty)
                  FilledButton(
                    onPressed: () {
                      plagueProvider.searchController.clear();
                    },
                    child: Text("Limpar Busca"),
                  ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int itemsPerRow = (constraints.maxWidth / maxExtentGrid)
                      .ceil();
                  if (itemsPerRow <= 0) itemsPerRow = 1;
                  int linesQuantity =
                      (plagueProvider.plagues!.length / itemsPerRow).ceil();

                  double scrollExtent = 0;
                  double extentPerLine = 0;
                  double scrollIndex = 0;
                  double indexCoef = 0; // varia de 2 e -2

                  if (_scrollController.hasClients) {
                    double pixelsPosition = _scrollController.position.pixels;
                    scrollExtent =
                        _scrollController.position.maxScrollExtent -
                        _scrollController.position.minScrollExtent;
                    extentPerLine = scrollExtent / linesQuantity;
                    scrollIndex = (pixelsPosition / extentPerLine)
                        .floorToDouble();
                    indexCoef = 2 * cos((pixelsPosition / scrollExtent) * pi);
                    scrollIndex = scrollIndex + indexCoef;
                  }

                  return GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: maxExtentGrid,
                    ),
                    itemCount: plagueProvider.plagues!.length,
                    padding: EdgeInsets.only(bottom: 20, top: 0),
                    itemBuilder: (context, index) {
                      double padding = 8;
                      double lineIndex = (index / itemsPerRow).floorToDouble();
                      double paddingCoef =
                          (scrollIndex - lineIndex).abs() * 3.5;
                      paddingCoef = paddingCoef > 25 ? 25 : paddingCoef;

                      return PlagueWidget(
                        plague: plagueProvider.plagues![index],
                        padding: padding + paddingCoef,
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
