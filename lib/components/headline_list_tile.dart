import 'package:flutter/material.dart';
import 'package:masala_headlines_flutter/screens/news_screen.dart';
import 'package:masala_headlines_flutter/utilities/constants.dart';

import '../models/news_headline_model.dart';

class HeadlineListTile extends StatelessWidget {
  const HeadlineListTile({
    super.key,
    required this.currentNewsArticle,
  });

  final NewsArticle currentNewsArticle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsScreen(
                        currentNewsArticle: currentNewsArticle,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: (currentNewsArticle.urlToImage == null)
                      ? const NetworkImage(
                          'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg')
                      : NetworkImage(currentNewsArticle.urlToImage!),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      currentNewsArticle.title!,
                      style: kHeadlinesScreenTextStyle,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Source: ${currentNewsArticle.source!.name!}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
