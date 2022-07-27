import 'package:flutter/material.dart';
import 'package:leanonusapp/db/setupDatabase.dart';

import '../widgets/custom_text_form_field.dart';

void main()
{
  runApp(RequestPage());
}

class RequestPage extends StatelessWidget {
   RequestPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(controller: _nameController, txtLabel: 'Name',),
              const SizedBox(height: 8.0,),
              CustomTextFormField(controller: _categoryController, txtLabel: 'Category',),
              const SizedBox(height: 8.0,),
              TextButton(
                  onPressed: () {

                  },
                  child: const Text('Add user to table'),
              )
            ],
          ),
        ),
      );
}