import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Settings Page"),
        ),
        body: new Center(
          child: new Text("Fill here"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: ('Back'),
          child: Icon(Icons.arrow_back),
        ));
  }
}
