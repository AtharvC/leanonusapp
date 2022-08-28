import 'package:flutter/material.dart';
import 'package:leanonusapp/globals.dart' as globals;

void main() {
  runApp(const ChapterPage());
}

class ChapterPage extends StatefulWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) => Scaffold(
          body: ListView(
        children: [
          Stack(
            children: [
              MainText("Chapter Name"),
            ],
          ),
        ],
      ));
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
}
