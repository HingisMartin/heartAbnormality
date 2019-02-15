import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './loginPage.dart';
import './registerPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cardia",
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(),
        routes: <String,WidgetBuilder>{
          "/registerpage": (BuildContext context) => new MyRegisterPage(title),
          "/loginpage": (BuildContext context) => new MyLoginPage(),
          //"/hoome":(BuildContext context)=>new HomePage()
        }
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

            Text("CARDIA",
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
              theme: ThemeData(
                primarySwatch: Colors.teal,
              ),
              home: MyLoginApp(),
            )),
                child: Text("Login",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'Roboto',
                ),)),
          ]

      );
}

