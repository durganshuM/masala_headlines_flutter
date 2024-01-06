import 'package:flutter/material.dart';

class HeadlinesScreen extends StatelessWidget {
  const HeadlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('Headlines Sections'),
          ),
        ),
      ),
    );
  }
}
