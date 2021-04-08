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

  //Constructor used to create posts from hardcoded data
  Post (String _title, String _author, String _date, bool _reported, List _tags, List _images){
    //uid = this.uid;
    title = _title;
    author = _author;
    date = _date;
    reported = _reported;
    tags = _tags;
    images = _images;
  }

  //Constructor that creates posts from Map objects recieved by firebase documents
  Post.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    author = data['author'];
    date = data['date'];
    reported = data['reported'];
    tags = data['tags'];
    images = data['images'];
  }

  //Returns a Map object from a post objects data to be used with firebase
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'category': category,
  //     'image': image,
  //     'subIngredients': subIngredients,
  //     'createdAt': createdAt,
  //     'updatedAt': updatedAt
  //   };

  String tagsToString(){
    return tags.toString(); //The formatting could be changed to look better when read on listtiles
  }

}