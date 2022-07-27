import 'package:flutter/material.dart';
import 'package:leanonusapp/Pages/User_Page.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    //'Home' Tab

    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
      Container(
          alignment: Alignment.topRight,
          child: Image(
            image: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C5603AQEnsjOPlffaLg/profile-displayphoto-shrink_200_200/0/1655478611769?e=2147483647&v=beta&t=N5Cw-CxNiHXGisYlUwBxfBZYzM_UNmOI1Z8szebr67Q'),
          )),
      Container(
          alignment: Alignment.center,
          child: Text(
            "Lean on Us Foundation is an organization that aims to help those affected by cognitive diseases through volunteering and fundraising efforts. We train, organize and mobilize volunteers to visit senior centers and interact with those who need it most.",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          )),
      Container(
          child: Text(
        "Over 30 registered chapters across the US, Mexico, and Canada ",
        style: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      )),
    ]),

    //'Requests' Tab
    Center(
      child: TextButton(
        onPressed: () {},
        child: const Text('Requests'),
      ),
    ),

    //'My Chapter' Tab
    Center(
      child: TextButton(
        onPressed: () {},
        child: const Text('My Chapter'),
      ),
    ),

    //'Account' Tab
    const UserPage(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Lean On Us App'),
          ),
          body: screens[currentIndex],
          bottomNavigationBar: NavigationBarTheme(
            data: const NavigationBarThemeData(
              height: 69,
              backgroundColor: Colors.white,
            ),
            child: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (currentIndex) =>
                  setState(() => this.currentIndex = currentIndex),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home, color: Colors.blue),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.location_on_sharp, color: Colors.blue),
                  label: 'Requests',
                ),
                NavigationDestination(
                  icon: Icon(Icons.business, color: Colors.blue),
                  label: 'My Chapter',
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle_rounded, color: Colors.blue),
                  label: 'Account',
                ),
              ],
            ),
          )),
    );
  }
}
