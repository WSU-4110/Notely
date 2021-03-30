import 'package:Notely/models/user.dart';
import 'package:Notely/screens/wrapper.dart';
import 'package:Notely/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

//Image.network('https://firebasestorage.googleapis.com/v0/b/notely-f1bdf.appspot.com/o/postImages%2Fstorage%2Femulated%2F0%2FAndroid%2Fdata%2Fcom.package.Notely%2Ffiles%2FPictures%2Fscaled_image_picker502299473865779434.jpg?alt=media&token=9a135f37-5a0b-417e-8eb3-a75e56748724'),

class MyApp extends StatelessWidget {
  // This is the root of the application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: User(),
      child: MaterialApp(
        theme: ThemeData(
            accentColor: Colors.tealAccent.shade400,
            primaryColor: Colors.tealAccent.shade400,
            primaryIconTheme: IconThemeData(
              color: Colors.white,
            ),
            primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                )),
        home: Wrapper(),
      ),
    );
  }
}
