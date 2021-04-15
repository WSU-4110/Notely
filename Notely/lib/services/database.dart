import 'dart:io';
//import 'package:intl/intl.dart';
import 'package:Notely/screens/createPosts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Notely/services/auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  

  final _firebaseStorage = FirebaseStorage.instance;

  // References to the main collections
  final CollectionReference postCollection =
      Firestore.instance.collection('Posts');
  final CollectionReference userInfoCollection =
      Firestore.instance.collection('UserInfo');

  Future updateUserData(String username, String name, String school) async {
    return await userInfoCollection.document(uid).setData({
      'username': username,
      'numberOfPosts': 0,
      'name': name,
      'school': school,
    });
  }

  Future getPostData() async {
    return await postCollection.document(uid).get();
  }

  Future getUserData() async {
    return await userInfoCollection.document(uid).get();
  }



  Future createPost(String postTitle, File image, String userId, List<String> tags) async {
    List<dynamic> urls = [];
    var downloadUrl = uploadImageToStorage(image);
    await downloadUrl.then((value) {
      urls.add(value);
    });
    return await postCollection.document(userId).collection('UserPosts').add({
      'title': postTitle,
      'images': urls,
      'tags': tags,
      'author': "Placeholder Username", //Julian, please make this work!
      'date': DateTime.now().toString(),
      'reported': false,
    });
  }


  Future createMultiplePicPost(String postTitle, File image, String userId, List<File> images, List<String> tags) async {
    List<dynamic> urls = [];
    var downloadUrl = uploadImageToStorage(image);
    await downloadUrl.then((value) {
      urls.add(value);
    });
    for (int i = 0; i < images.length; i++) {
      var imageUrl = uploadImageToStorage(images[i]);
      await imageUrl.then((value) {
        urls.add(value);
      });
    }
    return await postCollection.document(userId).collection('UserPosts').add({
      'title': postTitle,
      'images': urls,
      'tags': tags,
      'author': "Placeholder Username", //Julian, please make this work!
      'date': DateTime.now().toString(),
      'reported': false,

    });
  }

  Future uploadImageToStorage(File image) async {
    var file = File(image.path);

    if (image != null) {
      //Upload to Firebase
      var snapshot = await _firebaseStorage
          .ref()
          .child('postImages/' + image.path)
          .putFile(file)
          .onComplete;
      var downloadUrl = await snapshot.ref
          .getDownloadURL(); //This url needs to be given to the createPost page so it can be saved asa field in a post
      return downloadUrl.toString();
    } else {
      print('No Image Path Received');
    }
  }
}
