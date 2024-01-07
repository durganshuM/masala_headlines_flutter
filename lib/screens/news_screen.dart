import 'package:flutter/material.dart';
import 'package:masala_headlines_flutter/models/news_headline_model.dart';
import 'package:masala_headlines_flutter/utilities/constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.currentNewsArticle});
  final NewsArticle currentNewsArticle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffF2EBDF),
        appBar: AppBar(
          backgroundColor: const Color(0xffF2EBDF),
          shadowColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: (currentNewsArticle.urlToImage == null)
                          ? kNoImageAvailableURL
                          : NetworkImage(currentNewsArticle.urlToImage!),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    currentNewsArticle.title.toString(),
                    style: kNewsScreenTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    (currentNewsArticle.description == null)
                        ? 'No Description Available'
                        : currentNewsArticle.description.toString(),
                    style: kNewsScreenContentTextStyle,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    (currentNewsArticle.content == null)
                        ? 'No Content Available'
                        : currentNewsArticle.content.toString(),
                    style: kNewsScreenContentTextStyle,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Author: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          currentNewsArticle.author.toString(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Source: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          currentNewsArticle.source!.name.toString(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Published At: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          currentNewsArticle.publishedAt.toString(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Article Link: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          currentNewsArticle.url.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
