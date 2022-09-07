import 'package:flutter/material.dart';
import 'package:leanonusapp/globals.dart' as globals;

void main() {
  runApp(const ChapterPage());
}

class LeanOnUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tables',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChapterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChapterPage extends StatefulWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Chapter Members",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            textDirection: TextDirection.ltr,
            border: TableBorder.all(width: 1.0, color: Colors.black),
            children: [
              TableRow(children: [
                Text(
                  "Chapter Member 1",
                  textScaleFactor: 1.5,
                ),
              ]),
              TableRow(children: [
                Text("Chapter Member 2", textScaleFactor: 1.5),
              ]),
              TableRow(children: [
                Text("Chapter Member 3", textScaleFactor: 1.5),
              ]),
              TableRow(children: [
                Text("Chapter Member 4", textScaleFactor: 1.5),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}

Widget MainText(String label) => Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Text(
            label,
            style: const TextStyle(
              fontSize: 25,
            ),
          )),
        ],
      ),
    );
