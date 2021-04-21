import 'package:flutter/material.dart';
import 'package:Notely/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username ='';
  String error = '';
  String name = '';
  String school = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade400,
          elevation: 0.0,
          title: Text('Sign up to Notely',),
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person, color: Colors.white,),
                label: Text('Sign In', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  widget.toggleView();
                })
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person, ),
                      hintText: 'Enter a email',
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
                      hintText: 'Enter a password',
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (val) => val.length < 6 ? 'Enter a password over 6 characters long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter a username',
                      labelText: 'Username',
                    ),
                    validator: (val) => val.length < 4 ? 'Enter a username over 4 characters long' : null,
                    onChanged: (val) {
                      setState(() => username = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                    //validator: (val) => val.length < 4 ? 'Enter a username over 4 characters long' : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter your school name',
                      labelText: 'School',
                    ),
                    //validator: (val) => val.length < 4 ? 'Enter a username over 4 characters long' : null,
                    onChanged: (val) {
                      setState(() => school = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.tealAccent.shade400,
                      child: Text('Register', style: TextStyle(color: Colors.white,)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password, username, name, school);
                          if (result == null) {
                            setState(() => error = "Please supply a valid email");
                          }
                        }
                      }),
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
