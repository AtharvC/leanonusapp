import 'package:flutter/material.dart';
import 'package:leanonusapp/Pages/Home_Page.dart';
import 'package:leanonusapp/Pages/Requests_Page.dart';
import 'package:leanonusapp/Pages/User_Page.dart';
import 'package:leanonusapp/db/setupDatabase.dart';

import 'Pages/Chapter_Page.dart';
MyDatabase? database;

void main() {
  database = MyDatabase();
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  late MyDatabase _db;
  late User _account;
  late int _currentIndex = 0;

  @override
  initState() {
    _db = MyDatabase();
    getUser(2, _db).then((value) async {
      _account = value;
      print("Account name: ${_account.name} \n Account ID: ${_account.id}");
    });
    super.initState();
  }

  Widget getPage(int index) {
    switch (index){
      case 0:
        return const HomePage();
      case 1:
        return const RequestPage();
      case 2:
        print("Case 2 called \n Account name: ${_account.name} \n Account ID: ${_account.id}");
        return ChapterPage(chapterId: _account.id,);
      case 3:
        return const UserPage();
      default:
        return const HomePage();
    }
  }

  Future<User> getUser(int id, MyDatabase database) async{
    _account = await database.getUser(id);
    //_account;
    return _account;
  }

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lean On Us App'),
        ),
        body: getPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_sharp, color: Colors.blue),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.blue),
              label: 'My Chapter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded, color: Colors.blue),
              label: 'Account',
            ),
          ],
          onTap: onTabTapped,
          currentIndex: _currentIndex,
        ),
      ),

    );
  }
}