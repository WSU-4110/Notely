import 'dart:io';
import 'package:Notely/models/user.dart';
import 'package:flutter/material.dart';
import 'package:Notely/services/database.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

File imageToUpload;
User userInfo;

openCreatePost(context, File image) {
  imageToUpload = image;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CreatePost())); // Navigator to switch the user to Favorites Page screen
}

getUserInfo(User user) {
  DatabaseService(uid: user.uid).getUserData().then((value){
    userInfo = new User(username: value.data["name"], numberOfPosts: value.data["numberOfPosts"]);
  });
}

createPost(BuildContext context, String postTitle, String uid, List<File> images) async {
  if(images.length == 0){
    await DatabaseService().createPost(postTitle, imageToUpload, uid);
  }else{
    await DatabaseService().createMultiplePicPost(postTitle, imageToUpload, uid, images);
  }
}

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final _formKey = GlobalKey<FormState>();

  List<Widget> boxes = new List();
  List<File> images = new List();
  List<String> tags = new List();

  String postTitle = '';
  String error = '';
  int itemCount;
  File _image;

  void addPicToBoxes(){
    setState(() {
      boxes.insert(0,Card(
        child: InkWell(
          splashColor: Colors.tealAccent.shade400,
          onTap: () {_showPicker(context);},
          child: SizedBox (
            width: 100,
            height: 100,
            child: Image.file(_image),
          ),
        ),
      ));
    });
  }

  void addInitialBox(){
    setState(() {
      boxes.add(Card(
        child: InkWell(
          splashColor: Colors.tealAccent.shade400,
          onTap: () {_showPicker(context);},
          child: SizedBox (
            width: 100,
            height: 100,
            child: Icon(
              Icons.add,
            )
          ),
        ),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    addInitialBox();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new Post'),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5.0)),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10.0),),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2.0, color: Colors.tealAccent),
                      left: BorderSide(width: 2.0, color: Colors.tealAccent),
                      right: BorderSide(width: 2.0, color: Colors.tealAccent),
                      bottom: BorderSide(width: 2.0, color: Colors.tealAccent),
                    ),
                  ),
                  child: Image.file(imageToUpload, width: 100, height: 100,),
                ),
                Padding(padding: EdgeInsets.only(left: 10.0),),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                          decoration: const InputDecoration(
                          hintText: 'Title name',
                          labelText: 'Enter Post Title',
                        ),
                        validator: (val) => val.isEmpty ? 'Title' : null,
                        onChanged: (val) {
                          setState(() => {postTitle = val});
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0),),
                      Text(
                        //('Username: ' + userInfo.username), //This will fill in automagically
                        'Username: Julian Gombos',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0),),
              ],
              ),
            const Divider(
              height: 40,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.tealAccent,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              children: boxes,
            ),
            const Divider(
              height: 40,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Colors.tealAccent,
            ),
            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent.shade400)),
                onPressed: () {
                  createPost(context, postTitle, user.uid, images);
                  Navigator.pop(context);
                }, 
                child: Text('Create Post'),
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
          ],
        ),
      ), 
    );
  }

  _imgFromCamera() async {
    //Waits for the user to take a picture and stores it in File object
    File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;
      images.add(_image);
    });
    addPicToBoxes();
  }

  //Called if the user selects the option to pick an image from their gallery
  _imgFromGallery() async {
    //Waits for the user to select a picture and stores it in File object
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    //Updates the state with the new image. imageCache is called to prevent flutter from using cached images
    setState(() {
      imageCache.clear();
      _image = image;
      images.add(_image);
    });
    addPicToBoxes();
  }

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