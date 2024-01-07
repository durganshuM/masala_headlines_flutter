import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:masala_headlines_flutter/screens/headlines_screen.dart';
import 'package:provider/provider.dart';

import '../services/news_data.dart';

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
    await Provider.of<NewsData>(context, listen: false).getNews();
    navigation();
  }

  void navigation() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HeadlinesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitThreeBounce(
            color: Colors.blueGrey,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
