import 'package:flutter/material.dart';
import 'package:leanonusapp/Pages/Chapter_Page.dart';
import 'package:leanonusapp/Pages/Home_Page.dart';
import 'package:leanonusapp/Pages/Requests_Page.dart';
import 'package:leanonusapp/Pages/User_Page.dart';

import '../main.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/home_page':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/chapter_page':
        return MaterialPageRoute(builder: (_) => const ChapterPage());
      case '/requests_page':
        return MaterialPageRoute(builder: (_) => const RequestPage());
      case '/user_page':
        return MaterialPageRoute(builder: (_) => const UserPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Sorry, no route was found!', style: TextStyle(color: Colors.red, fontSize: 18.0),),
        ),
      );
    });
  }
}