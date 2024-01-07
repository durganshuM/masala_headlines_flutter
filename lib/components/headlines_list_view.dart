import 'package:flutter/material.dart';
import 'package:masala_headlines_flutter/services/news_data.dart';
import 'package:provider/provider.dart';

import 'headline_list_tile.dart';

class HeadlinesListView extends StatelessWidget {
  const HeadlinesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsData>(
      builder: (context, newsData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var currentNewsArticle = newsData.newsArticles[index];
            return HeadlineListTile(currentNewsArticle: currentNewsArticle);
          },
          itemCount: newsData.newsArticlesLength,
        );
      },
    );
  }
}
