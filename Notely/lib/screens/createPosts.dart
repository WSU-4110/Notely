import 'dart:io';
import 'package:Notely/models/user.dart';
import 'package:flutter/material.dart';
import 'package:Notely/services/database.dart';
import 'package:provider/provider.dart';

File imageToUpload;
User userInfo;

openCreatePost(context, File image) {
  imageToUpload = image;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CreatePost())); // Navigator to switch the user to Favorites Page screen
}

uploadPhoto(){
  dynamic downloadUrl = DatabaseService().uploadImageToStorage(imageToUpload);
}

getUserInfo(User user) {
  DatabaseService(uid: user.uid).getUserData().then((value){
    userInfo = new User(username: value.data["name"], numberOfPosts: value.data["numberOfPosts"]);
  });
}

createPost(BuildContext context, String postTitle, String uid) async {
  await DatabaseService().createPost(postTitle, imageToUpload, uid);
  Navigator.pop(context);
}

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final _formKey = GlobalKey<FormState>();

  String postTitle = '';
  String error = '';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.tealAccent.shade400)),
                  onPressed: () {
                    createPost(context, postTitle, user.uid);
                  }, 
                  child: Text('Create Post'),
                  ),
              ],
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
}