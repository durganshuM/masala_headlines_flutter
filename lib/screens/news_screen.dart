import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('News Section'),
          ),
        ),
      ),
    );
  }
}
