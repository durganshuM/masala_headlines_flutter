import 'package:flutter/material.dart';
import 'package:masala_headlines_flutter/services/news.dart';

class HeadlinesScreen extends StatefulWidget {
  const HeadlinesScreen({
    super.key,
    required this.newsData,
  });

  final dynamic newsData;

  @override
  State<HeadlinesScreen> createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.newsData);
  }

  void updateUI(dynamic newsData) {
    print(newsData);
    setState(() {
      //
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
                updateUI(await NewsModel().getNews());
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        body: const SafeArea(
          child: Center(
            child: Text('Headlines Sections'),
          ),
        ),
      ),
    );
  }
}
