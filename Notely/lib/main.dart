import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Notely', //The title here and the one below will eventually change since a logo will be used instead of a string for the title
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Notely'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; //We should change this to hold our logo image file

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SearchBar searchBar; //Search bar object

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
    //This should contain the searchbar and hamburger button i think?
    return new AppBar(
      title: new Text(widget.title),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _openCamera,
        tooltip: 'Make post',
        child: Icon(Icons.add_a_photo),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              //Each ListTile here should have an onTap() to pull out their respective menus
              title: Text('Profile'),
              leading: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.book_outlined),
            ),
            ListTile(
              title: Text('Advanced Search'),
              leading: Icon(Icons.eco_outlined),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }, // Function call for settings page.
              leading: Icon(Icons.settings),
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
