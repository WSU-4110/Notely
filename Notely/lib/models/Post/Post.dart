import 'dart:io';

abstract class Post {
  //final String uid; //These Ids need to be generated on creation or maybe given when put into firebase
  String title, username;
  String date; //Might make a class for date so we dont gotta parse
  String iconPicUrl;
  List<String> tags; //Need a type for this list. Maybe string? List<String> tags
  File iconImage;

  Post({this.title, this.date, this.tags, this.username, this.iconImage}); //I think we would use the flutter thing key:uniquekey or something. 

  Type getPostType();

  String getTitle(){
    return this.username;
  }

  void setTitle(String title){
    this.title = title;
  }

  String getUsername(){
    return this.username;
  }

  void setUsername(String username){
    this.username = username;
  }

  String getDate(){
    return this.date;
  }

  void setDate(String date){
    this.date = date;
  }

  List<String> getTags(){
    return this.tags;
  }

  File getIconImage(){
    return this.iconImage;
  }

  void setIconImage(File image){
    this.iconImage = image;
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