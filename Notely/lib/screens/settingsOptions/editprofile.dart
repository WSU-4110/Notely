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
        //creates the top menu bar
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          elevation: 0.0,
          title: Text('Edit Profile'),
          //If user wants to cancel changes:
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
        //Creates the main container for the list.
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: tempKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  //Text form for change email
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter new email',
                      labelText: 'Email',
                    ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    //Stores the newly changed value into variable 'email'.
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  //Form to change passwords (protected characters).
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
                      //Stores the changed value into variable 'password'
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  //form to change major.
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Change Major',
                      labelText: 'Major',
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      //stores the changes in variable 'major'
                      setState(() => major = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  //button to set the changes.
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
