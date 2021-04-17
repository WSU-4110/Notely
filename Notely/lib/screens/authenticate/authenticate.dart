import 'package:Notely/screens/authenticate/register.dart';
import 'package:Notely/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

//This class handles which authentication widget is displayed. The options are the login or register screen
//When a user logs in or registers, the stream automatically hears that and the screen is changed by the wrapper class


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  //This is used to toggle between the login screen and the register screen
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
