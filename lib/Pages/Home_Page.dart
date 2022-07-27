import 'package:flutter/material.dart';

void main()
{
  runApp(const HomePage());
}

class HomePage extends StatelessWidget
{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
    Container(
        alignment: Alignment.topRight,
        child: const Image(
          image: NetworkImage(
              'https://media-exp1.licdn.com/dms/image/C5603AQEnsjOPlffaLg/profile-displayphoto-shrink_200_200/0/1655478611769?e=2147483647&v=beta&t=N5Cw-CxNiHXGisYlUwBxfBZYzM_UNmOI1Z8szebr67Q'),
        )),
    Container(
        alignment: Alignment.center,
        child: const Text(
          "Lean on Us Foundation is an organization that aims to help those affected by cognitive diseases through volunteering and fundraising efforts. We train, organize and mobilize volunteers to visit senior centers and interact with those who need it most.",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        )),
    Container(
        child: const Text(
          "Over 30 registered chapters across the US, Mexico, and Canada ",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        )),
  ]);
}