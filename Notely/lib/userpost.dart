import 'dart:io';





class UserPost{
  String title; //Name of post
  List<String> tags; //All tags on post
  List<File> userImages;  //Will store images client side. Will use first image for thumbnail



  UserPost(String _title, List<String> _tags, List<File> _userImages){
    this.title = _title;
    this.tags = _tags;
    this.userImages = _userImages;
  }



  
}