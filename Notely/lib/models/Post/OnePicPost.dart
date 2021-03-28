import 'dart:io';
import 'package:Notely/models/Post/Post.dart';

class OnePicPost extends Post{
  
  OnePicPost(String title, String date, List<String> tags, String username, File image) : super(title: title, date: date, tags: tags, username: username, iconImage: image);

  @override
  Type getPostType(){
    return OnePicPost;
  }
}