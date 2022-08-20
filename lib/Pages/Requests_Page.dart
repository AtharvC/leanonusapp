import 'package:flutter/material.dart';
import 'package:leanonusapp/db/setupDatabase.dart';
import 'package:drift/drift.dart' as drift;
import 'package:leanonusapp/globals.dart' as globals;
import '../widgets/custom_text_form_field.dart';

void main()
{
  runApp(const RequestPage());
}

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  late MyDatabase _db;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

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
        children: [
          CustomTextFormField(controller: _nameController, txtLabel: 'Name',),
          const SizedBox(height: 8.0,),
          CustomTextFormField(controller: _categoryController, txtLabel: 'Category',),
          const SizedBox(height: 8.0,),
          TextButton(
            onPressed: () {
              addUser();
            },
            child: const Text('Add user to table'),
          )
        ],
      ),
    ),
  );

  void addUser() {
    final entity = UsersCompanion(
      name: drift.Value(_nameController.text),
      category: drift.Value(int.parse(_categoryController.text)),
    );
    _db.insertUser(entity).then((value) {
      getUser(1, _db).then((values) {
        globals.account = values;
        print("Account name: ${globals.account.name} \n Category: ${globals.account.category}");
      });
      return ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(content: Text('New user inserted: $value'), actions: [
          TextButton(
              onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
              child: const Text('Close'))
        ],
        ));
      },
    );
  }

  getUser(int id, MyDatabase db) async {
    globals.account = await db.getUser(id);
    //globals.account;
    return globals.account;
  }
}
