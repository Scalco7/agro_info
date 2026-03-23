import 'package:agro_info/app/common/models/news/news_model.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final List<NewsModel> news;
  const NewsWidget({super.key, required this.news});

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
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                NewsModel actualNew = news[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: BoxBorder.all(
                        color: colorScheme.tertiaryFixedDim,
                        width: 2
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                          child: Image.network(
                            actualNew.urlToImage,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            actualNew.title ?? actualNew.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
