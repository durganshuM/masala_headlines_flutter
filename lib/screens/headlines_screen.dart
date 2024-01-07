import 'package:flutter/material.dart';
import 'package:masala_headlines_flutter/screens/loading_screen.dart';
import 'package:masala_headlines_flutter/utilities/constants.dart';
import 'package:provider/provider.dart';

import '../components/headlines_list_view.dart';
import '../services/news_data.dart';

class HeadlinesScreen extends StatefulWidget {
  const HeadlinesScreen({super.key});

  @override
  State<HeadlinesScreen> createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  String errorText = 'Network Error';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kPrimaryColor1,
        appBar: AppBar(
          backgroundColor: kPrimaryColor2,
          shadowColor: Colors.black,
          title: const Text(
            'Masala Headlines',
            style: kAppBarTitleTextStyle,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoadingScreen()),
                    (route) => false);
              },
              icon: const Icon(
                Icons.refresh,
                color: kSecondaryColor2,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: (Provider.of<NewsData>(context).newsArticlesLength == 0)
                ? Text(
                    errorText,
                    style: kHeadlinesScreenTextStyle,
                  )
                : const HeadlinesListView(),
          ),
        ),
      ),
    );
  }
}
