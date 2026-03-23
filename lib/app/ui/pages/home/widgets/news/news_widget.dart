import 'package:agro_info/app/common/models/news/news_model.dart';
import 'package:agro_info/app/ui/pages/home/widgets/news/new_box_widget.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  final bool isLoadingMore;
  final List<NewsModel> news;
  final void Function() fetchNews;
  const NewsWidget({
    super.key,
    required this.news,
    required this.fetchNews,
    required this.isLoadingMore,
  });

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  ScrollController listViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    listViewController.addListener(onScroll);
  }

  @override
  void dispose() {
    listViewController.dispose();
    super.dispose();
  }

  void onScroll() {
    double scrollPosition = listViewController.offset;
    double maxScroll = listViewController.position.maxScrollExtent;

    if (scrollPosition > maxScroll - 140) {
      widget.fetchNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: colorScheme.tertiaryFixed, width: 4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "Notícias",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              controller: listViewController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.isLoadingMore
                  ? widget.news.length + 1
                  : widget.news.length,
              itemBuilder: (BuildContext context, int index) {
                bool isLoadingWidget = index >= widget.news.length;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLoadingWidget
                      ? SizedBox(
                          width: 140,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: colorScheme.onTertiaryContainer,
                              constraints: BoxConstraints(
                                maxWidth: 50,
                                minWidth: 50,
                                maxHeight: 50,
                                minHeight: 50,
                              ),
                            ),
                          ),
                        )
                      : NewBoxWidget(newData: widget.news[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
