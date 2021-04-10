import 'package:Notely/models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'dart:core';

//This class is used to create and store post objects to be read from listview widgets.
class Postmaster{
  List<Post> postList = []; //Holds the post objects that are read by the ListView Widget
  String _collection = "TestPosts2";  //Name of directories we are reading from for easy access
  String _subcollection = "TestSubCollection";

  //Main Constructor. Populates postList on creation
  Postmaster(){
    print("Postmaster is alive!!!");
    getPosts();
    print("Posts recieved!");
    print("Number of post objects: " + postList.length.toString());
  }


// getPosts() async {
//     QuerySnapshot snapshot = await Firestore.instance.collection(_collection).getDocuments(); //Waits for response from server and gathers toplevel docs
//     snapshot.documents.forEach((doc) {
//       print("THIS IS THE CURRENT DOC IM LOOKING AT: " + doc.documentID);
//       getSubDocs(doc.documentID); //Calls each individual document by its ID to access its subdocs
//     });
//   }













  //Accesses documents in database and populates postList with post objects from subdocs
  getPosts() async {
    QuerySnapshot snapshot = await Firestore.instance.collection(_collection).getDocuments(); //Waits for response from server and gathers toplevel docs
    snapshot.documents.forEach((doc) {
      print("THIS IS THE CURRENT DOC IM LOOKING AT: " + doc.documentID);
      getSubDocs(doc.documentID); //Calls each individual document by its ID to access its subdocs
    });
  }

  //Accesses subdocuments and creates the post objects
  //In a perfect world, this could be deleted
  getSubDocs(docID) async {
    var subdocs = await Firestore.instance.collection(_collection).document(docID).collection(_subcollection).getDocuments(); //Takes a snapshot of all subdocs in document
    subdocs.documents.forEach((subdocument) { 
      Post post = Post.fromMap(subdocument.data);
      postList.add(post);
    });
  }

  //For Testing: Retrieves a snapshot of data currently on database and prepares the data into post objects
  // getPosts() async{
  //   QuerySnapshot snapshot = await Firestore.instance.collection('TestPosts').getDocuments();
  //   snapshot.documents.forEach((document) {
  //     Post post = Post.fromMap(document.data);
  //     postList.add(post);
  //   });
  // }

  // Clears the postList
  void clearPostList(){
    postList.clear();
  }

}