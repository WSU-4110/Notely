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
        body: ListView
          .separated //Creates a separated list of tiles to appear on the favorites page
          (
        itemBuilder: (BuildContext context,
                int index) //Creates items to appear in the list
            {
          return ListTile //This widget will probably be changed to something else, or at least given a clicking ability
              (title: Text('item $index') //Displays the number on the tile
                  );
        },
        separatorBuilder: (BuildContext context, int index) =>
            Divider(), //Creates divides between items, will probably be changed to spaces instead of lines later
        itemCount: 40, //This will change to an infinite scroll later
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

