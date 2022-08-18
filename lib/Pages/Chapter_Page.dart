import 'package:flutter/material.dart';

void main() {
  runApp(const ChapterPage(
    chapterId: 2,
  ));
}

class ChapterPage extends StatefulWidget {
  final int? chapterId;
  const ChapterPage({Key? key, this.chapterId}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.chapterId;
    print('Passed Id to the Widget: ${widget.chapterId}');

    Text text;
    if (widget.chapterId == 1) {
      text = const Text('Chapter Page for Chapter President');
    } else if (widget.chapterId == 2) {
      text = const Text('Facility Page for Senior Care Facility');
    } else {
      text = const Text("null");
      return Column(
        children: [
          const Text('Wrong route entered. Please try again'),
          Text(widget.chapterId.toString()),
        ],
      );
    }

    return Scaffold(
        body: Center(
            child: Column(
              children: [
                text,
                Text(widget.chapterId.toString()),
              ],
            )
        )
    );
  }
}