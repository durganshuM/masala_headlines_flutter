import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: SpinKitFoldingCube(
              color: Colors.blueGrey,
              size: 75.0,
            ),
          ),
        ),
      ),
    );
  }
}
