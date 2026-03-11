import 'package:agro_info/app/common/providers/plague_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var plagueProvider = Provider.of<PlagueProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: TextField(
              controller: plagueProvider.searchController,
              decoration: InputDecoration(
                labelText: "Pesquisar Pragas",
                prefixIcon: Icon(Icons.search_outlined),
                hintText: "Pesquisar...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
        ],
      ),
    );
  }
}
