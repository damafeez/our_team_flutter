import 'package:flutter/material.dart';
import 'package:our_team/screens/our_team.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: OurTeam(),
    );
  }
}
