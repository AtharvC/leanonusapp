import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leanonusapp/db/setupDatabase.dart';
import 'package:drift/drift.dart' as drift;
import 'package:leanonusapp/globals.dart' as globals;
import '../widgets/custom_text_form_field.dart';

void main() {
  runApp(const RequestPage());
}

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  double value = 0;
  double total = 0;
  late MyDatabase _db;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _requestController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  double progress = 0.0;
  @override
  void initState() {
    super.initState();
    _db = globals.database;
  }

  @override
  Widget build(BuildContext context) {
    if(globals.account.category == 1)
      {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: value,
                    backgroundColor: Colors.yellow,
                    color: const Color(0xFF4C7FC8),
                  ),
                ),
                CustomTextFormField(
                    controller: _requestController, txtLabel: 'Total Requests'),
                TextButton(
                  onPressed: () {
                    buildProgress();
                    if (value == 1) {
                      null;
                    }
                  },
                  child: const Text('Request Completed'),
                ),
                TextButton(
                  onPressed: () {
                    addRequests();
                  },
                  child: const Text('Add Request Total'),
                ),
              ],
            ),
          ),
        );
      }
    else if (globals.account.category == 2)
      {
        return const Scaffold(
          //insert code for Senior Care Facility here
        );
      }
    else
      {
        return const Center(child: Text('Wrong account type entered'),);
      }
  }
  void addRequests() {
    total = double.parse(_requestController.text);
  }

  void buildProgress() {
    setState(() {
      value = value + (1.0 / total);
    });
  }
}
