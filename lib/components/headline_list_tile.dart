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
            color: kSecondaryColor1,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: (currentNewsArticle.urlToImage == null)
                          ? kNoImageAvailableURL
                          : NetworkImage(currentNewsArticle.urlToImage!),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0x90000000),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          currentNewsArticle.title!,
                          style: kHeadlinesScreenTextStyle,
                        ),
                        kSizedBox5,
                        Text(
                          'Source: ${currentNewsArticle.source!.name!}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kSecondaryColor2,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
