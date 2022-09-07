import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => Scaffold(
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
                  color: Color(0xFF4C7FC8),
                ),
              ),
              CustomTextFormField(
                  controller: _requestController, txtLabel: 'Total Requests'),
              TextButton(
                onPressed: () {
                  BuildProgress();
                  if (value == 1) {
                    null;
                  }
                },
                child: const Text('Request Completed'),
              ),
              TextButton(
                onPressed: () {
                  AddRequests();
                },
                child: const Text('Add Request Total'),
              ),
            ],
          ),
        ),
      );
  void AddRequests() {
    total = double.parse(_requestController.text);
  }

  void BuildProgress() {
    setState(() {
      value = value + (1.0 / total);
    });
  }
}
