import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:masala_headlines_flutter/screens/headlines_screen.dart';
import 'package:masala_headlines_flutter/services/news.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  void getNewsData() async {
    var newsData = await NewsModel().getNews();
    navigation(newsData: newsData);
  }

  void navigation({required dynamic newsData}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HeadlinesScreen(newsData: newsData)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.blueGrey,
            size: 75.0,
          ),
        ),
      ),
    );
  }
}
