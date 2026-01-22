import 'package:flutter/material.dart';
import 'project2.dart';

void main() {
  runProject2();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Project 2"),
        ),
        body: const Center(
          child: Text(
            "Project 2 запущено.",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
