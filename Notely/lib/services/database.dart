import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final _firebaseStorage = FirebaseStorage.instance;

  // References to the main collections
  final CollectionReference postCollection = Firestore.instance.collection('Posts');
  final CollectionReference userInfoCollection = Firestore.instance.collection('UserInfo');

  Future updateUserData(String name) async {
    return await userInfoCollection.document(uid).setData({
      'name': name,
      'numberOfPosts': 0,
    });
  }

  Future getUserData() async {
    return await userInfoCollection.document(uid).get();
  }

  Future createPost(String postTitle, File image, String userId) async {
    dynamic url;
    var downloadUrl = uploadImageToStorage(image);
    await downloadUrl.then((value) {
      url = value;
    });
    return await postCollection.document(userId).collection('UserPosts').add({
      'postTitle': postTitle,
      'imageUrl': url.toString(),
    });
  }

  Future uploadImageToStorage(File image) async {
    var file = File(image.path);
    
    if (image != null){
        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
        .child('postImages/' + image.path)
        .putFile(file).onComplete;
        var downloadUrl = await snapshot.ref.getDownloadURL(); //This url needs to be given to the createPost page so it can be saved asa field in a post
        return downloadUrl.toString();
      } else {
        print('No Image Path Received');
      }
  }
}