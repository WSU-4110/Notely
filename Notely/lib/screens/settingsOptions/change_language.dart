import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

//Stateful widget
class _NotificationsPageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //creates the top menu bar
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          elevation: 0.0,
          title: Text('Change Language'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //functionality to the back button.
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text('Coming Soon!'),
        ));
  }
}
