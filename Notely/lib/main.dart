import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notely', //The title here and the one below will eventually change since a logo will be used instead of a string for the title
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Notely'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SearchBar searchBar; //Search bar object
  nothing() {}

  //Function that builds the appbar and returns it.
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text(widget.title),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  //Constructor for this instantiates searchBar
  _MyHomePageState() {
    searchBar = new SearchBar(inBar: false, setState: setState, onSubmitted: print, buildDefaultAppBar: buildAppBar);

  File _image; //Will be used to store and reference the image taken or chosen by the user.

  //Called when the user hits the plus button. Calls showPicker which opens up the modul on the bottom of the screen
  void _openCamera() {
    _showPicker(context);

  }

  @override
  Widget build(BuildContext context) {

    //Dirty temporary code used to display the image chosen or taken as a proof of concept of the camera system. This will get removed.
    if (_image == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openCamera,
          tooltip: 'Make post',
          child: Icon(Icons.add),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(_image.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openCamera,
          tooltip: 'Make post',
          child: Icon(Icons.add),
        ),
      );
    }
  }

  //Called if the user selects the option to take a picture
  _imgFromCamera() async {
    //Waits for the user to take a picture and stores it in File object
    File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);

    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;
    });
  }

  //Called if the user selects the option to pick an image from their gallery
  _imgFromGallery() async {
    //Waits for the user to select a picture and stores it in File object
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;
    });
  }

  //Function is used to display the modul at the bottom of the screen when the plus button is selected.
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery(); //Function call for picking an image from the gallery
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
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
