import 'package:agro_info/app/common/models/news/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewBoxWidget extends StatelessWidget {
  final NewsModel newData;
  const NewBoxWidget({super.key, required this.newData});

  Future<void> _launchMyUrl() async {
    final Uri url = Uri.parse(newData.url);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir a URL: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => _launchMyUrl(),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: BoxBorder.all(color: colorScheme.tertiaryFixedDim, width: 2),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Image.network(
                newData.urlToImage,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newData.title ?? newData.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
