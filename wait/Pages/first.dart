import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "",
        home: new Container(
            child:Column(
              children: <Widget>[
                Image.network('https://media.giphy.com/media/8jidnMiqa1r32/giphy.gif',
                  fit: BoxFit.fitWidth,
                ),

              ],
            )
        ),
    );
  }
}