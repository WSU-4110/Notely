import 'package:Notely/models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Notely/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:core';

class Postmaster{
  List<Post> postList = []; //Holds the post objects that are read by the ListView Widget

  Postmaster(){
    getPosts();
  }

  //Retrieves a snapshot of data currently on database and prepares the data into post objects
  getPosts() async{
    QuerySnapshot snapshot = await Firestore.instance.collection('TestPosts').getDocuments();
    snapshot.documents.forEach((document) {
      Post post = Post.fromMap(document.data);
      postList.add(post);
    });
  }

  //Used for testing only. Loads hardcoded posts for postmaster to read.
  void testloadPosts(){
    var templist1 = ["Cats", "Big Cats", "Meow"];
    var templist2 = ["Reynolds", "Troll Toll", "Nightcrawlers"];
    var templist3 = ["Math", "Nerd stuff", "Whatever"];
    postList.add(new Post("CSC 3200 Notes", "Bookworm97", "4/7/2021", false, templist1, ["https://3.bp.blogspot.com/-BDAGgWkK1-Y/VcPBhjZeR6I/AAAAAAAABiY/svh4aNkHPAo/s1600/IMG_8819_picmonkeyed.jpg"]));
    postList.add(new Post("ART 4100 Lecture", "Nightman_xx", "3/23/2021", false, templist2, ["https://kaylablogs.com/wp-content/uploads/2016/09/aphasia-notes.jpg"]));
    postList.add(new Post("MTH 2150 Complex Numbers", "pointDexter314", "3/9/2021", false, templist3, ["https://wallpapercave.com/wp/wp6810211.jpg"]));
  }
}