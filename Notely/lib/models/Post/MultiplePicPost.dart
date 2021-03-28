import "package:Notely/models/Post/Post.dart";
import 'dart:io';

class MultiplePicPost extends Post{

  List<String> picUrls;
  List<File> pics;

  MultiplePicPost(String title, String date, List<String> tags, String username) : super(title: title, date: date, tags: tags, username: username);

  @override
  Type getPostType(){
    return MultiplePicPost;
  }

  List<String> getPicUrls(){
    return this.picUrls;
  }

  List<File> getPics(){
    return this.pics;
  }

  void addImageToList(File image){
    pics.add(image);
  }

  void setPictureInList(int index, File image){
    pics.insert(index, image);
  }

  int getNumberOfPics(){
    return pics.length;
  }
}