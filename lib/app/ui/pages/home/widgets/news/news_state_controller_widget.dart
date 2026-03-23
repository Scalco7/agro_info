import 'package:agro_info/app/common/states/news_state.dart';
import 'package:agro_info/app/common/viewmodels/home_viewmodel.dart';
import 'package:agro_info/app/ui/pages/home/widgets/news/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsStateControllerWidget extends StatelessWidget {
  const NewsStateControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Consumer<HomeViewmodel>(
        builder: (context, homeViewmodel, widget) {
          INewsState state = homeViewmodel.newsState;

          switch (state) {
            case LoadingNewsState():
              return Center(child: const CircularProgressIndicator());
            case FailureNewsState():
              return Center(child: Text(state.errorMessage));
            case LoadedNewsState():
              return NewsWidget(news: state.newsData.articles);
          }
        },
      ),
    );
  }
}
