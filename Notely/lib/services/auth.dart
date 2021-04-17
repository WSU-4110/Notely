import 'package:Notely/models/user.dart';
import 'package:Notely/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

//This class interacts with the database directly and handles any authentication

class AuthService {

  //Firebase authentication object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object from firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Anonymous signin functionality. It works but is not implemented in the app anymore
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Function is called if the user is trying to register a new account
  Future registerWithEmailAndPassword(String email, String password, String username) async {
    try {

      //Trys to register a new account and returns the result of that
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      //Get the user that was just created
      FirebaseUser user = result.user;

      //Update the user's information in the database
      await DatabaseService(uid: user.uid).updateUserData(username);
      return _userFromFirebaseUser(user);
    } catch (e) {
      //There was an issue registering the new user
      print(e.toString());
      return null;
    }
  }

  //Function is called when the user tries to login
  Future signInWithEmailAndPassword(String email, String password) async {
    try {

      //Try to login and return the result
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);

      //Get the user that just logged in
      FirebaseUser user = result.user;

      //Provide the DatabaseService with the user ID of the user so that queries can be made
      await DatabaseService(uid: user.uid);
      return _userFromFirebaseUser(user);
    } catch (e) {
      //There was an issue logging in
      print(e.toString());
      return null;
    }
  }

  //Function is called whenver the user logs out of the app
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
