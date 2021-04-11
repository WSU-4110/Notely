import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final tempKey = GlobalKey();
  String email = '';
  String password = '';
  String error = '';
  String major = ' ';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          elevation: 0.0,
          title: Text('Edit Profile'),
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                label: Text('Cancel', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: tempKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter new email',
                      labelText: 'Email',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter new password',
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'Enter a password over 6 characters long'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Change Major',
                      labelText: 'Major',
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => major = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.tealAccent.shade400,
                      child:
                          Text('Change', style: TextStyle(color: Colors.white)),
                      onPressed: () {}),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              )),
        ));
  }
}
