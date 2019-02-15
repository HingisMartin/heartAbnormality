import 'package:flutter/material.dart';
import './primary_button.dart';

class MyRegisterPage extends StatelessWidget {
  final String title;
  String _email;
  String _password;
  String _cpassword;
  String _age;

  Widget padded({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: child,
    );
  }

  MyRegisterPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              padded(child: new TextFormField(
                key: new Key('email'),
                decoration: new InputDecoration(labelText: 'Email'),
                autocorrect: false,
                validator: (val) =>
                val.isEmpty
                    ? 'Email can\'t be empty.'
                    : null,
                onSaved: (val) => _email = val,
              )),
              padded(child: new TextFormField(
                key: new Key('password'),
                decoration: new InputDecoration(labelText: 'Password'),
                obscureText: true,
                autocorrect: false,
                validator: (val) =>
                val.isEmpty
                    ? 'Password can\'t be empty.'
                    : null,
                onSaved: (val) => _password = val,
              )
              ),
              padded(child: new TextFormField(
                key: new Key('cpassword'),
                decoration: new InputDecoration(
                    labelText: 'Confirmed Password'),
                obscureText: true,
                autocorrect: false,
                validator: (val) =>
                val.isEmpty
                    ? 'Password can\'t be empty.'
                    : null,
                onSaved: (val) => _cpassword = val,
              )
              ),
              new PrimaryButton(
                key: new Key('register'),
                text: 'Register',
                height: 44.0,
                onPressed: null,

              ),
            ],
          ),
          // children: usernameAndPassword() + submitWidgets(),

        )

    );
  }
}


