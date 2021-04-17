import 'package:Notely/models/user.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';
import 'package:flutter/material.dart';

//This class wraps around the whole app. It will determine what to display depending on if the user is logged in or not
//If the user is not logged in, then it will load the Authenticate widget so the user can login or register.
//If they are logged in, then it will display MyHomePage
//The stream automatically listens to any changes here to get the data

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      print(user.uid);
      return MyHomePage(title: 'Notely');
    }
  }
}
