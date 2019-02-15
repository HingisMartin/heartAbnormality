import 'package:flutter/material.dart';

import './pages/home.dart';
/*
void main() => runApp(new MaterialApp(
  home: new HomePage(),

));
*/
class Login extends StatefulWidget{
  @override
  _LoginState createState() => new _LoginState();

}
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: "CARDIA",
    );
  }

}

