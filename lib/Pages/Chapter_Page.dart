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

  @override
  Widget build(BuildContext context) {
    print('Passed Id to the Widget: ${globals.account.id}');

    Text text;
    if (globals.account.category == 1) {
      text = const Text('Chapter Page for Chapter President');
    } else if (globals.account.category == 2) {
      text = const Text('Facility Page for Senior Care Facility');
    } else {
      text = const Text("null");
      return Column(
        children: [
          const Text('Wrong route entered. Please try again'),
          Text(globals.account.category.toString()),
        ],
      );
    }

    return Scaffold(
        body: Center(
            child: Column(
              children: [
                text,
                Text(globals.account.category.toString()),
              ],
            )
        )
    );
  }
}