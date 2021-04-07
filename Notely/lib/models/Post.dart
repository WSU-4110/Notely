
class Post {
  //final String uid; //These Ids need to be generated on creation or maybe given when put into firebase
  String title;
  String imagelink;
  String date; //Might make a class for date so we dont gotta parse
  List tags;  
  List images;  //Might be a list of ids of images in the database and we stream em right to the phone?

  //Post({this.uid}); //I think we would use the flutter thing key:uniquekey or something. 

  Post (String _title, String _imagelink){
    //uid = this.uid;
    title = _title;
    imagelink = _imagelink;
  }


}


//This is for a post view screen
// import 'dart:html';
// import 'package:flutter/material.dart';
// class Post extends StatefulWidget{
// }
// class _post extends State<post> {
//   @override
//   Widget build(BuildContext context) {
//   }
// }