import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: kSecondaryColor2,
        appBar: AppBar(
          backgroundColor: kPrimaryColor2,
          shadowColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: kSecondaryColor2,
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
                  kSizedBox5,
                  Text(
                    currentNewsArticle.title.toString(),
                    style: kNewsScreenTitleTextStyle,
                  ),
                  kSizedBox20,
                  Text(
                    (currentNewsArticle.description == null)
                        ? 'No Description Available'
                        : currentNewsArticle.description.toString(),
                    style: kNewsScreenContentTextStyle,
                  ),
                  kSizedBox20,
                  Text(
                    (currentNewsArticle.content == null)
                        ? 'No Content Available'
                        : currentNewsArticle.content.toString(),
                    style: kNewsScreenContentTextStyle,
                  ),
                  kSizedBox20,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  kSizedBox20,
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
                        'Full Article: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          currentNewsArticle.url.toString(),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(
                              text: currentNewsArticle.url.toString()));
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.black,
                        ),
                      )
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
