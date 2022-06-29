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
    Center(
      child: TextButton(
        onPressed: () {},
        child: const Text('Home'),
      ),
    ),

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
        )
      ),
    );
  }
}