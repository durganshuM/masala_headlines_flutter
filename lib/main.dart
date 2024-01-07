import 'package:flutter/material.dart';
import 'package:masala_headlines_flutter/screens/loading_screen.dart';
import 'package:masala_headlines_flutter/services/news_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsData(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const LoadingScreen(),
      ),
    );
  }
}
