import 'package:flutter/material.dart';

void main() => runApp(signIn());

class signIn extends StatelessWidget {
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
  final Key keyOne = PageStorageKey('pageOne');
  final Key keyTwo = PageStorageKey('pageTwo');
  final Key keyThree = PageStorageKey('pageThree');

  int currentTab = 0;

  PageOne one;
  PageTwo two;
  PageThree three;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    one = PageOne(
      key: keyOne,
    );
    two = PageTwo(
      key: keyTwo,
    );
    pages = [one, two ,three];

    currentPage = one;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cardia"),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Login',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Sign up",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatefulWidget {

  final List<Data> dataList;
  PageOne({
    Key key,
    this.dataList,
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  String _username,_pass;
  final GlobalKey <FormState> _formKey = GlobalKey <FormState >();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardia'),
      ),
      body: Form(child: Column(
        children: <Widget>[
          TextFormField(
          validator: (input){
            if(input.isEmpty){
              return 'Enter Username';
            }
          },
            onSaved: (input)=>_username=input,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextFormField(
            obscureText: true,
            validator: (input){
              if(input.isEmpty){
                return 'Enter Password ';
              }
            },
            onSaved: (input)=>_pass=input,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          RaisedButton(
            onPressed: null,
           child: Text('SUbmit'),
          ),
        ],
      ),
      ),
    );
  }

}

class PageTwo extends StatefulWidget {
  PageTwo({Key key}) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
            child:
            TextField(
              decoration: InputDecoration(
                  labelText: "Username",
                  border: InputBorder.none,
                  hintText: "Enter your email id or phone no."
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
            child: TextField(
              obscureText : true,
              decoration: InputDecoration(
                // labelStyle: ,
                  labelText: "Password",
                  border: InputBorder.none,
                  hintText: "Enter your password."
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
            child: TextField(
              obscureText : true,
              decoration: InputDecoration(
                // labelStyle: ,
                  labelText: "Re-enter Password",
                  border: InputBorder.none,
                  hintText: "Enter your password."
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
            child: TextField(
              decoration: InputDecoration(
                // labelStyle: ,
                  labelText: "Age",
                  border: InputBorder.none,
                  hintText: "Enter your password."
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
            child: TextField(
              decoration: InputDecoration(
                // labelStyle: ,
                labelText: "Gender",
                border: InputBorder.none,
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          const RaisedButton(
            onPressed: null,
            padding: const EdgeInsets.all(20.0),
            color: Colors.teal,
            textColor: Colors.white,
            child: Text("Submit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class PageThree extends StatefulWidget {
  PageThree({Key key}) : super(key: key);

  @override
  PageThreeState createState() => PageThreeState();
}

class PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return null;
  }

}

class Data {
  final int id;
  bool expanded;
  final String title;
  Data(this.id, this.expanded, this.title);
}