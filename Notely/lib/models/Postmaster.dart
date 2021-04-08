import 'package:Notely/models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Notely/services/database.dart';
import 'package:provider/provider.dart';
import 'dart:core';


  // QuerySnapshot querySnapshot = await Firestore.instance.collection("collection").getDocuments();
  // var list = querySnapshot.documents;

class Postmaster{
  //var postCollection;
  List<Post> postList = []; 
  //File fileName; //This would be replaced with firebase url
  //DatabaseService database = new DatabaseService();
  
  //QuerySnapshot querySnapshot
  
  Postmaster(){
    //print("Postmaster has been created"); 
    loadPosts();
    //print("Post text in 1st slot = " + postList[0].title);
    
    //postCollection = DatabaseService().getPostData();
  }

  void loadPosts(){

    //querySnapshot = await Firestore.instance.collection("collection").getDocuments();
    //List templist = querySnapshot.documents;

    // for (i = 0; i < templist; ++i){
    //   postList.add(new Post(templist[0]))
    // }
    
    //I had to hardcode these because file reading was giving me issues, and I need them for testing purposes
    var templist1 = ["Cats", "Big Cats", "Meow"];
    var templist2 = ["Reynolds", "Troll Toll", "Nightcrawlers"];
    var templist3 = ["Math", "Nerd stuff", "Whatever"];
    postList.add(new Post("CSC 3200 Notes", "Bookworm97", "4/7/2021", false, templist1, ["https://3.bp.blogspot.com/-BDAGgWkK1-Y/VcPBhjZeR6I/AAAAAAAABiY/svh4aNkHPAo/s1600/IMG_8819_picmonkeyed.jpg"]));
    postList.add(new Post("ART 4100 Lecture", "Nightman_xx", "3/23/2021", false, templist2, ["https://kaylablogs.com/wp-content/uploads/2016/09/aphasia-notes.jpg"]));
    postList.add(new Post("MTH 2150 Complex Numbers", "pointDexter314", "3/9/2021", false, templist3, ["https://wallpapercave.com/wp/wp6810211.jpg"]));
  }
}