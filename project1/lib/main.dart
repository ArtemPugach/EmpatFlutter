import 'package:flutter/material.dart';
import 'person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final person = Person(firstName: "Артем", lastName: "Пугач");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Project 1 Flutter")),
        body: Center(
          child: Text(
            person.fullName,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
