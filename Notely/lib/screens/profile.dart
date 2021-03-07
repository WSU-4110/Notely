import 'package:flutter/material.dart';

class Profile {}

openProfile(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyProfilePage()));
}

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    );
  }
}