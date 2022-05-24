import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Lean On Us App'),
        ),
        body: Container(
          child: const Text('Demo for LoU'),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}