import 'package:flutter/material.dart';

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
    Center(
      child: TextButton(
        onPressed: () {},
        child: const Text('Home'),
      ),
    ),
    Center(
      child: TextButton(
        onPressed: () {},
        child: const Text('My Chapter'),
      ),
    ),
    Center(
      child: TextButton(
        onPressed: () {},
        child: const Text('Requests'),
      ),
    ),
    Center(
      child: TextButton(
        onPressed: () {},
        child: const Text('Account'),
      ),
    ),
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueAccent,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'My Chapter',
                backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_sharp),
                label: 'Requests',
                backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Account',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}