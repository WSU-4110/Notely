
class Post {
  final String uid; //These Ids need to be generated on creation or maybe given when put into firebase
  String title;
  String date; //Might make a class for date so we dont gotta parse
  List<String> tags;  
  List<String> images;  //Might be a list of ids of images in the database and we stream em right to the phone?

  Post({this.uid, this.title, this.date, this.tags, this.images}); //I think we would use the flutter thing key:uniquekey or something. 

  String getUID(){
    return this.uid;
  }

  String getTitle(){
    return this.title;
  }

  String setTitle(String newTitle){
    this.title = newTitle;
    return this.title;
  }

  String getDate(){
    return this.date;
  }

  String setDate(String newDate){
    this.date = newDate;
    return this.date;
  }

  List<String> getTags(){
    return tags;
  }

  List<String> setTags(List<String> newTags){
    this.tags = newTags;
    return this.tags;
  }

  List<String> getImages(){
    return this.images;
  }

  List<String> setImages(List<String> newImages){
    this.images = newImages;
    return this.images;
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