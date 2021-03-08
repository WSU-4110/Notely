import 'package:flutter/material.dart';

class Favorites {}

openFavorites(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyFavoritesPage())); // Navigator to switch the user to Favorites Page screen
}

class MyFavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      // The following code is a button which will return the user back to the main page.
      // body: Center(
      //     child: ElevatedButton(
      //         child: Text('Back to main page'),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         }))
    );
  }
}
