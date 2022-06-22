import 'package:flutter/material.dart';

void main()
{
  runApp(const UserPage());
}

class UserPage extends StatelessWidget
{
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blue,
                constraints: const BoxConstraints(
                  maxHeight: 350,
                ),
              ),
              userInfo(),
            ],
          )
        ],
      )
    );

  Widget userInfo() => Container(
    padding: const EdgeInsets.all(32),
    child: Column(
        children: const [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            backgroundColor: Colors.transparent,
            radius: 100,
          ),
          Center(
            heightFactor: 3,
            child: Text(
                'Random Person',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),

        ]
    ),
  );
}


