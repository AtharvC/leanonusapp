import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) => Scaffold(
          body: ListView(
        children: [
          Stack(
            children: [
              ImageLogo(),
            ],
          ),
          MainText(
              "Lean on Us Foundation is an organization that aims to help those affected by cognitive diseases through volunteering and fundraising efforts. We train, organize and mobilize volunteers to visit senior centers and interact with those who need it most. Over 30 registered chapters across the US, Mexico, and Canada. ")
        ],
      ));

  Widget ImageLogo() => Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(32),
        child: Column(children: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media-exp1.licdn.com/dms/image/C5603AQEnsjOPlffaLg/profile-displayphoto-shrink_200_200/0/1655478611769?e=2147483647&v=beta&t=N5Cw-CxNiHXGisYlUwBxfBZYzM_UNmOI1Z8szebr67Q'),
            backgroundColor: Colors.transparent,
            radius: 50,
          ),
        ]),
      );

  Widget MainText(String label) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
                child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
              ),
            )),
          ],
        ),
      );
}
