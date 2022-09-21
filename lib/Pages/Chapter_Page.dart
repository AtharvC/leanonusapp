import 'package:flutter/material.dart';
import 'package:leanonusapp/globals.dart' as globals;

void main() {
  runApp(const ChapterPage());
}

class LeanOnUsApp extends StatelessWidget {
  const LeanOnUsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tables',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChapterPage(),
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
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon = const Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {
      floatingIcon = const Icon(Icons.add);

      data = [];
      listDynamic = [];
    }
    setState(() {});
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add(DynamicWidget());
  }

  submitData() {
    floatingIcon = const Icon(Icons.arrow_back);
    data = [];
    for (var widget in listDynamic) {
      data.add(widget.controller.text);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget result = Flexible(
        flex: 1,
        child: Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        data[index],
                        textScaleFactor: 1.5,
                      ),
                    ),
                    const Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField = Flexible(
      flex: 2,
      child: ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    Widget submitButton = ElevatedButton(
      onPressed: submitData,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Submit Data'),
      ),
    );

    if(globals.account.category == 1)
      {
        return MaterialApp(
          home: Scaffold(
            body: Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  data.isEmpty ? dynamicTextField : result,
                  data.isEmpty ? submitButton : Container(),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: addDynamic,
              child: floatingIcon,
            ),
          ),
        );
      }
    else if (globals.account.category == 2)
      {
        return const MaterialApp(
          //insert code for Senior Care Facility here
          );
      }
    else
      {
        return const Center(child: Text('Wrong account type, please try again'),);
      }

  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  DynamicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Enter Chapter Members'),
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
