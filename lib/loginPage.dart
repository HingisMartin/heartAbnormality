import 'package:flutter/material.dart';
import  './registerPage.dart';
import './primary_button.dart';

class MyLoginApp extends StatelessWidget {
  String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cardia",
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyLoginPage(),
        initialRoute: '/',
        routes: <String,WidgetBuilder>{
          "/registerpage": (BuildContext context) => new MyRegisterPage(title),
          "/loginpage": (BuildContext context) => new MyLoginPage(),
          //"/hoome":(BuildContext context)=>new HomePage()
        }
    );
  }
}

enum FormType {
  login,
  register
}

class MyLoginPage extends StatelessWidget{
  //@override
//  _MyLoginPageState createState() => _MyLoginPageState();

//}
 // holds data related to the form
//class _MyLoginPageState extends State<MyLoginPage>{
  static final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _cpassword;
  String _age;
  FormType _formType = FormType.login;
  String _authHint = '';
  // padding
  Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: child,
    );
  }

  List<Widget> detailEntry(){
    return [
      padded(child: new TextFormField(
        key: new Key('height'),
        decoration: new InputDecoration(labelText: 'Height'),
        obscureText: true,
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Password can\'t be empty.' :null,
        onSaved: (val) => _cpassword = val,
      )
      ),
      new PrimaryButton(
          text: 'Next',
          height: 44.0,
          onPressed: null
      )
    ];

  }

  final _formKey = GlobalKey <FormState>();
  @override
  void sign(){
    print("hello");
  }
  Widget build(BuildContext context) {
    // form widget using global key => identifies the form widget uniquely
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardia'),
      ),
      key: _formKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
       // children: usernameAndPassword() + submitWidgets(),
        children: <Widget>[
          padded(child: new TextFormField(
            key: new Key('email'),
            decoration: new InputDecoration(labelText: 'Email'),
            autocorrect: false,
            validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
            onSaved: (val) => _email = val,
          )),
          padded(child: new TextFormField(
            key: new Key('password'),
            decoration: new InputDecoration(labelText: 'Password'),
            obscureText: true,
            autocorrect: false,
            validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
            onSaved: (val) => _password = val,
          )
          ),
          PrimaryButton(
            key: new Key('login'),
            text: 'Login',
            height: 44.0,
            onPressed:sign,
          ),

          FlatButton(
            key: new Key('need-account'),
            child: new Text("Need an account? Register"),
            onPressed: () =>Navigator.pushNamed(context,'MyRegisterPage()'),

            ),
        ],
      )

    );

  }
}
