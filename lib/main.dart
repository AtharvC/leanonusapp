import 'package:flutter/material.dart';
import 'package:leanonusapp/Pages/Home_Page.dart';
import 'package:leanonusapp/Pages/Requests_Page.dart';
import 'package:leanonusapp/Pages/User_Page.dart';
import 'package:leanonusapp/db/setupDatabase.dart';
import 'package:leanonusapp/globals.dart' as globals;
import 'Pages/Chapter_Page.dart';

MyDatabase? database;

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  late MyDatabase _db;
  late int _currentIndex = 0;

  @override
  initState() {
    _db = globals.database;
    getUser(1, _db).then((value) {
      globals.account = value;
      print("Account name: ${globals.account.name} \n Account ID: ${globals.account.id}");
    });
    super.initState();
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const RequestPage();
      case 2:
        print(
            "Case 2 called \n Account name: ${globals.account.id} \n Account ID: ${globals.account.id}");
        return const ChapterPage();
      case 3:
        return const UserPage();
      default:
        return const HomePage();
    }
  }

  Future<User> getUser(int id, MyDatabase database) async {
    globals.account = await database.getUser(id);
    //globals.account;
    return globals.account;
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
          backgroundColor: Color(0xFF4C7FC8),
        ),
        body: getPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          backgroundColor: Colors.blueAccent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF4C7FC8)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_sharp, color: Color(0xFF4C7FC8)),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Color(0xFF4C7FC8)),
              label: 'My Chapter',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.account_circle_rounded, color: Color(0xFF4C7FC8)),
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
