import "package:Notely/models/Post/Post.dart";
import 'dart:io';

class MultiplePicPost extends Post{

  List<String> _picUrls;
  List<File> _pics;

  MultiplePicPost(String title, String date, List<String> tags, String username) : super(title: title, date: date, tags: tags, username: username);

  @override
  Type getPostType(){
    return MultiplePicPost;
  }

  List<String> getPicUrls(){
    return this._picUrls;
  }

  List<File> getPics(){
    return this._pics;
  }

  void addImageToList(File image){
    _pics.add(image);
  }

  void setPictureInList(int index, File image){
    _pics.insert(index, image);
  }

  int getNumberOfPics(){
    return _pics.length;
  }
}