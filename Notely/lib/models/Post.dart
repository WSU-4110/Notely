//import 'package:cloud_firestore/cloud_firestore.dart';
//
class Post {
  //final String uid; //These Ids need to be generated on creation or maybe given when put into firebase
  String title;
  String author;
  String date; //Might make a class for date so we dont gotta parse, timestamp
  
  bool reported;  //Will eventually be used to filter in listview

  List tags;  
  List images;  //Might be a list of ids of images in the database and we stream em right to the phone?

  //Post({this.uid}); //I think we would use the flutter thing key:uniquekey or something. 

  Post (String _title, String _author, String _date, bool _reported, List _tags, List _images){
    //uid = this.uid;
    title = _title;
    author = _author;
    date = _date;
    reported = _reported;
    tags = _tags;
    images = _images;
  }

  // Post.fromMap(Map<String, dynamic> data) {
  // }

  String tagsToString(){
    return tags.toString();
  }

}