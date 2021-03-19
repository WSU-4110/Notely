import 'package:Notely/models/user.dart';
import 'package:Notely/screens/wrapper.dart';
import 'package:Notely/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This is the root of the application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: User(),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
