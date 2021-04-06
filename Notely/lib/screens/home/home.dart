import 'package:Notely/models/user.dart';
import 'package:Notely/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:Notely/screens/settings.dart';
import 'package:Notely/screens/favorites.dart';
import 'package:provider/provider.dart';
import 'package:Notely/screens/profile.dart';
import 'package:Notely/screens/createPosts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; //We should change this to hold our logo image file

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic userInfo;

  SearchBar searchBar; //Search bar object

  final AuthService _auth = AuthService();

  File
      _image; //Will be used to store and reference the image taken or chosen by the user.

  //Constructor for this instantiates searchBar
  _MyHomePageState() {
    searchBar = SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  //Function that builds the appbar and returns it.
  AppBar buildAppBar(BuildContext context) {
    userInfo = Provider.of<User>(context);
    //This should contain the searchbar and hamburger button i think?
    return new AppBar(
      title: new Text('Notely',
          style: TextStyle(
            fontFamily: 'MontserratAlternates',
          )),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  //Called when the user hits the plus button. Calls showPicker which opens up the modul on the bottom of the screen
  void _openCamera() {
    _showPicker(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: ListView
          .separated //Creates a separated list of tiles to appear on the main page
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
      floatingActionButton: FloatingActionButton(
        onPressed: _openCamera,
        tooltip: 'Make post',
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.tealAccent.shade400,
              ),
            ),
            ListTile(
              //Each ListTile here should have an onTap() to pull out their respective menus
              title: Text('Profile'),
              leading: Icon(Icons.account_circle),
              onTap: () {
                openProfile(context, userInfo);
              },
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.book_outlined),
              onTap: () {
                openFavorites(context);
              },
            ),
            ListTile(
              title: Text('Advanced Search'),
              leading: Icon(Icons.eco_outlined),
            ),
            ListTile(
                //Got the settings page to load in.
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () {
                  openSettings(context);
                }),
            ListTile(
              title: Text('Sign out'),
              leading: Icon(Icons.person),
              onTap: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  //Called if the user selects the option to take a picture
  _imgFromCamera() async {
    //Waits for the user to take a picture and stores it in File object
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;
    });
    openCreatePost(context, image);
  }

  //Called if the user selects the option to pick an image from their gallery
  _imgFromGallery() async {
    //Waits for the user to select a picture and stores it in File object
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;
    });
    openCreatePost(context, image);
  }

  //Function is used to display the module at the bottom of the screen when the plus button is selected.
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery(); //Function call for picking an image from the gallery
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera(); //Function call for taking an image with the camera
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
