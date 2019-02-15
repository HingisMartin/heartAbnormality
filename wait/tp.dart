import 'package:flutter/material.dart';
import './Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cardia',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar :new MyAppBar(
        title: Text(''),
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),

            Text("     CARDIA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class MyAppBar extends AppBar{
  MyAppBar({ Key key, Widget title}) :
        super(
          title: title,
          actions : <Widget> [

            new FlatButton(onPressed:()=> runApp(new MaterialApp(
              home: new Login(),

            )), child: Text("Login",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              fontFamily: 'Roboto',
            ),)),
          ]

      );
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[
          Text("user"),
        ],
      ),
    );
  }
}