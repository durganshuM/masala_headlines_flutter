import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:masala_headlines_flutter/screens/headlines_screen.dart';
import 'package:masala_headlines_flutter/utilities/constants.dart';
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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HeadlinesScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: SpinKitThreeBounce(
            color: Colors.black,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
