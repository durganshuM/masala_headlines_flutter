import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/news_data.dart';

class HeadlinesScreen extends StatefulWidget {
  const HeadlinesScreen({super.key});

  @override
  State<HeadlinesScreen> createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  String centerText = 'Headlines Screen';

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    var newsArticles =
        Provider.of<NewsData>(context, listen: false).getNewsArticles;
    setState(() {
      if (newsArticles == null) {
        centerText = 'Network Error';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Masala Headline'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                updateUI();
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Text(centerText),
          ),
        ),
      ),
    );
  }
}
