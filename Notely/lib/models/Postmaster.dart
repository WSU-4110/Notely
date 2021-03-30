import 'package:Notely/models/DemoPosts.dart';

//import 'package:Notely/models/Post.dart';
//import 'package:Notely/assets/demodata.txt';

import 'dart:io';
//import 'package:path_provider/path_provider.dart';

class Postmaster{
  List<DemoPost> postList;  //this should maybe be static
  File fileName; //This would be replaced with firebase url
  


  Postmaster(){
    print("HEY I EXIST!!!");
    fileName = new File('demodata.txt'); //Sorry for hardcoding this, but i gotta test it.
    loadPosts();
  }

  void loadPosts(){

    fileName.readAsLines().then((value) => 
      (){
          for (int i = 0; i < value.length; i += 2)
          {
            print(value[i]);
            postList[i] = new DemoPost(value[i], value[i+1]);

          }
        }
    );



  }
  //return number of posts successfully loaded?

  //void addPost()
  //adds an individual post from the next line or something

  //clearList()
  //empties the whole list


}