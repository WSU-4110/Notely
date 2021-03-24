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

  uploadImageToStorage(File image) async {
    var file = File(image.path);
    
    if (image != null){
        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
        .child('images/imageName')
        .putFile(file).onComplete;
        var downloadUrl = await snapshot.ref.getDownloadURL(); //This url needs to be saved in database or something
      } else {
        print('No Image Path Received');
      }
  }
}