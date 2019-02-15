import 'package:flutter/material.dart';
import './first.dart' as first;
import './second.dart' as second;
import './third.dart' as third;

import './page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String currentProfilePic = "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";
  String otherProfilePic = "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Cardio"), backgroundColor: Colors.teal,
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.healing),text:"Heart beat",),
                  new Tab(icon: new Icon(Icons.camera_enhance),text:"PPG",),
                  new Tab(icon: new Icon(Icons.receipt),text :"Condition"),
                ]
            ),

        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text("bramvbilsen@gmail.com"),
                accountName: new Text("Bramvbilsen"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(currentProfilePic),
                  ),
                  onTap: () => print("This is your current account."),
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(otherProfilePic),
                    ),
                    onTap: () => switchAccounts(),
                  ),
                ],
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                        fit: BoxFit.fill
                    )
                ),
              ),
              new ListTile(
                  title: new Text("Records"),
                  trailing: new Icon(Icons.fiber_manual_record),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Records")));
                  }
              ),
              new ListTile(
                  title: new Text("Doctor's Detail"),
                  trailing: new Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Doctors")));
                  }

              ),
              new ListTile(
                  title: new Text("Doctor's Detail"),
                  trailing: new Icon(Icons.crop_square),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Medicines Record")));
                  }

              ),

              new ListTile(
                  title: new Text("Settings"),
                  trailing: new Icon(Icons.settings),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Settings")));
                  }

              ),
              new Divider(),
              new ListTile(
                title: new Text("Cancel"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),

        body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ]
    )
    );
  }
}