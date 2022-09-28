import 'package:flutter/material.dart';
import 'package:leanonusapp/Routes/routeGenerator.dart';
import 'package:leanonusapp/db/setupDatabase.dart';
import 'package:drift/drift.dart' as drift;
import 'package:leanonusapp/globals.dart' as globals;
import 'package:leanonusapp/main.dart';
import '../widgets/custom_text_form_field.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<LoginPage> {
  late MyDatabase _db;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  final _navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    _db = globals.database;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    scaffoldMessengerKey: _messengerKey,
        navigatorKey: _navKey,
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60.0,
                          ),
                          const Text(
                            'Please enter the following information to sign up: \n(All fields are required)',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          CustomTextFormField(
                            controller: _nameController,
                            txtLabel: 'Name',
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CustomTextFormField(
                            controller: _categoryController,
                            txtLabel: 'Category',
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextButton(
                            onPressed: () {
                              final entity = UsersCompanion(
                                name: drift.Value(_nameController.text),
                                category: drift.Value(int.parse(_categoryController.text)),
                              );
                              _db.insertUser(entity).then(
                                    (value) {
                                  getUser(1, _db).then((values) {
                                    globals.account = values;
                                    print(
                                        "Account name: ${globals.account.name} \n Category: ${globals.account.category}");
                                  });
                                  return _messengerKey.currentState?.showMaterialBanner(MaterialBanner(
                                    content: Text('New user inserted: $value'),
                                    actions: [
                                      TextButton(
                                          child: const Text('Close'),
                                        onPressed: () {
                                          _messengerKey.currentState?.hideCurrentMaterialBanner();
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()));
                                        },
                                      ),
                                    ],
                                  ));
                                },
                              );
                            },
                            child: const Text('Add user to table'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      );
  }

  void addUser() {

  }

  getUser(int id, MyDatabase db) async {
    globals.account = await db.getUser(id);
    //globals.account;
    return globals.account;
  }
}
