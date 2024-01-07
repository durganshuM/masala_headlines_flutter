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
  String centerText = 'Headlines Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.black,
          title: const Text(
            'Masala Headlines',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontWeight: FontWeight.bold,
            ),
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
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: (Provider.of<NewsData>(context).newsArticlesLength == 0)
                ? Text(centerText)
                : const HeadlinesListView(),
          ),
        ),
      ),
    );
  }
}
