import 'package:Notely/models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'dart:core';

//This class is used to create and store post objects to be read from listview widgets.
class Postmaster{
  List<Post> postList = []; //Holds the post objects that are read by the ListView Widget
  //String _collection = "TestPosts2";  //Name of directories we are reading from for easy access. Uncomment when connected to db.
  //String _subcollection = "TestSubCollection";

  //Main Constructor. Populates postList on creation
  Postmaster(){
    print("Postmaster is alive!!!");
    //getPosts();
    //loadTestPosts();
  }


  // Clears the postList
  void clearPostList(){
    postList.clear();
  }

  //Safely accesses post
  Post getPost(int postListPosition){
    try{
      if (postList.isNotEmpty){
        return postList[postListPosition];
      } else {
        throw new Exception("No post exists at that position");
      }
    }catch (e){
      print(e);
      return null;
    }
  }

  void addPost(Post newPost){
    postList.add(newPost);
  }

  void removeReportedPosts(){
    if (postList.isNotEmpty){
      for (int i = 0; i < postList.length; ++i){
          if (postList[i].reported == true)
            postList.removeAt(i);
      }
    }
  }

  List<Post> getListByTag(String searchTerm){
    List<Post> postsWithTag = [];
    if (postList.isNotEmpty){
      for (int i = 0; i < postList.length; ++i){
        if (postList[i].tags.contains(searchTerm)){
          postsWithTag.add(postList[i]);
        }
      }
    }
    return postsWithTag;
  }

  void loadTestPosts(){
    addPost(new Post("CSC 4200", "NiteBird24", "4/7/2021", false, ["Computers", "Programming", "Bosu", "Jazz", "Python"], ["https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.collegefashion.net%2Fwp-content%2Fuploads%2F2019%2F01%2Flecture-notesjpg.jpg&f=1&nofb=1", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3.amazonaws.com%2Flibapps%2Faccounts%2F106594%2Fimages%2Fnotesonmindmap.jpg&f=1&nofb=1"]));
    addPost(new Post("Biology 2200", "BookWurm95", "2/17/2019", false, ["Mollusks", "Aminita", "Dirt", "Microbe"], ["https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.vidyarthiplus.com%2Fshop%2Fmedia%2Fcatalog%2Fproduct%2Fcache%2F1%2Fimage%2F9df78eab33525d08d6e5fb8d27136e95%2Fe%2Fm%2Femt_001.png&f=1&nofb=1","https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffocus.meisterlabs.com%2Fwp-content%2Fuploads%2F2016%2F05%2FHandwritten-Notes.png&f=1&nofb=1","https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.cs.cmu.edu%2F~eugene%2Fteach%2Fauto01%2Fnotes%2Fpage01.jpg&f=1&nofb=1"]));
    addPost(new Post("Intro to Art", "Gold_leader_xx", "3/12/2020", true, ["Death Star Plans", "Prof. Wedge", "Bothans"], ["https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcollections.countway.harvard.edu%2Fonview%2Ffiles%2Foriginal%2Fc40d40a81512ee2b9b321f4013de0ac1.jpg&f=1&nofb=1",]));
    addPost(new Post("Math 2100", "DanielJackson", "5/23/2020", false, ["Calulus", "Vector spaces", "Span", "3.14", "Wenson's 3:00 class"], ["https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-k1WdwYAKWgw%2FULTtkUape9I%2FAAAAAAAABbo%2FFcZeom6y4oU%2Fs1600%2F003.jpg&f=1&nofb=1","https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F1.bp.blogspot.com%2F-HoYKTrNz9WI%2FULTtnwplhWI%2FAAAAAAAABbw%2FQEVCoEWxyiU%2Fs1600%2F004.jpg&f=1&nofb=1","https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcourses.csail.mit.edu%2F6.897%2Fspring05%2Ferik_notes%2F100dpi%2FL17-1.jpg&f=1&nofb=1"]));
    addPost(new Post("Special Topics section 32451", "Winchester", "4/6/2021", false, ["Deep learning", "Agony"], ["https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fd20ohkaloyme4g.cloudfront.net%2Fimg%2Fdocument_thumbnails%2F780e6195b1b150178a33c521f1476fad%2Fthumb_1200_1697.png&f=1&nofb=1"]));
    print("Test Posts loaded!");
    print("Number of post objects: " + postList.length.toString());
  }
}












  //Code Snippets for other functionality

  // //Accesses documents in database and populates postList with post objects from subdocs
  // getPosts() async {
  //   QuerySnapshot snapshot = await Firestore.instance.collection(_collection).getDocuments(); //Waits for response from server and gathers toplevel docs
  //   snapshot.documents.forEach((doc) {
  //     print("THIS IS THE CURRENT DOC IM LOOKING AT: " + doc.documentID);
  //     getSubDocs(doc.documentID); //Calls each individual document by its ID to access its subdocs
  //   });
  // }

  // //Accesses subdocuments and creates the post objects
  // //In a perfect world, this could be deleted
  // getSubDocs(docID) async {
  //   var subdocs = await Firestore.instance.collection(_collection).document(docID).collection(_subcollection).getDocuments(); //Takes a snapshot of all subdocs in document
  //   subdocs.documents.forEach((subdocument) { 
  //     Post post = Post.fromMap(subdocument.data);
  //     postList.add(post);
  //   });
  // }

  //For Testing: Retrieves a snapshot of data currently on database and prepares the data into post objects
  // getPosts() async{
  //   QuerySnapshot snapshot = await Firestore.instance.collection('TestPosts').getDocuments();
  //   snapshot.documents.forEach((document) {
  //     Post post = Post.fromMap(document.data);
  //     postList.add(post);
  //   });
  // }
  // 
  // // getPosts() async {
  //     QuerySnapshot snapshot = await Firestore.instance.collection(_collection).getDocuments(); //Waits for response from server and gathers toplevel docs
  //     snapshot.documents.forEach((doc) {
  //       print("THIS IS THE CURRENT DOC IM LOOKING AT: " + doc.documentID);
  //       getSubDocs(doc.documentID); //Calls each individual document by its ID to access its subdocs
  //     });
  //   }
  // 
  //     // postList.forEach(
    //   (post) { 
    //     if (post.reported){
    //       postList.remove(post);
    //     } 
    //   });