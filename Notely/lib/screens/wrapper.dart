import 'package:Notely/models/user.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';
import 'package:flutter/material.dart';

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
