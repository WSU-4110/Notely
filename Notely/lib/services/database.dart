import 'dart:io';
import 'package:intl/intl.dart';
import 'package:Notely/screens/createPosts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Notely/services/auth.dart';

class DatabaseService {

  //The users ID used for searching in the database
  final String uid;

  //Class constructor
  DatabaseService({this.uid});
  
  //Firebase storage instance used whenever pictures are uploaded
  final _firebaseStorage = FirebaseStorage.instance;

  // References to the main collections
  final CollectionReference postCollection =
      Firestore.instance.collection('Posts');
  final CollectionReference userInfoCollection =
      Firestore.instance.collection('UserInfo');

  //Called whenever the user's data is updated
  Future updateUserData(String name) async {

    //Set the user's information in the document of the collection
    return await userInfoCollection.document(uid).setData({
      'name': name,
      'numberOfPosts': 0,
    });
  }

  //Returns a document containing the users' posts
  Future getPostData() async {
    return await postCollection.document(uid).get();
  }

  //Get all the user's information
  Future getUserData() async {
    return await userInfoCollection.document(uid).get();
  }

  //Function is used to create a post that only has one picture
  Future createPost(String postTitle, File image, String userId, List<String> tags) async {

    //List holds the urls for the images that are uploaded. These url's are used to get the images later on
    List<dynamic> urls = [];

    //Upload the image to the database and return the url where the image is stored
    var downloadUrl = uploadImageToStorage(image);
    await downloadUrl.then((value) {
      urls.add(value);
    });

    await postCollection.document(userId).setData({'verified': true}); //Adds a verification field so subcollections can be read
    //Create a document for the post and fill in all the data
    return await postCollection.document(userId).collection('UserPosts').add({
      'title': postTitle,
      'images': urls,
      'tags': tags,
      'author': "Placeholder Username",
      'date': DateTime.now().toString(),
      'reported': false,
    });
  }

  //Function is used when there are more than one images in a post
  Future createMultiplePicPost(String postTitle, File image, String userId, List<File> images, List<String> tags) async {

    //List contains all the urls to the images that were uploaded. These url's are used to get the images later on
    List<dynamic> urls = [];

    //Upload the main image displayed for the post and get the url of it
    var downloadUrl = uploadImageToStorage(image);
    await downloadUrl.then((value) {
      urls.add(value);
    });

    //Upload each of the images to the database and get the url of that image which is stored in 'urls'
    for (int i = 0; i < images.length; i++) {
      var imageUrl = uploadImageToStorage(images[i]);
      await imageUrl.then((value) {
        urls.add(value);
      });
    }
    await postCollection.document(userId).setData({'verified': true}); //Adds a verification field so subcollections can be read
    //Create a document for the post and fill in all the data
    return await postCollection.document(userId).collection('UserPosts').add({
      'title': postTitle,
      'images': urls,
      'tags': tags,
      'author': "Placeholder Username", //Julian, please make this work!
      'date': DateTime.now().toString(),
      'reported': false,

    });
  }

  //Function uploads an image to storage
  Future uploadImageToStorage(File image) async {
    var file = File(image.path);

    if (image != null) {
      //Upload to Firebase
      var snapshot = await _firebaseStorage
          .ref()
          .child('postImages/' + image.path)
          .putFile(file)
          .onComplete;
      //Get the image url after it is uploaded
      var downloadUrl = await snapshot.ref
          .getDownloadURL(); //This url needs to be given to the createPost page so it can be saved asa field in a post
      return downloadUrl.toString();
    } else {
      print('No Image Path Received');
    }
  }
}
