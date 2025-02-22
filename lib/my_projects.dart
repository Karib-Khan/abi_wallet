import 'package:flutter/material.dart';
import 'base_scaffold.dart';

class MyProjectsScreen extends StatefulWidget {
  @override
  _MyProjectsScreenState createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Center(
        child: Text(
          'My Projects Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}