import 'package:test/test.dart';
import 'package:Notely/models/user.dart';

//Written by:

void main(){
  //----------------------Getters and setters for userID------------------------
  test('User ID setter should correctly set uid data', () async {
    User user = new User(uid: "testuid", username: "testUsername", numberOfPosts: "12");
    user.userID = "temp";

    expect(user.userID, "temp");
  });

  test('User ID getter should correctly return the uid', () async {
    User user = new User(uid: "testuid", username: "testUsername", numberOfPosts: "12");

    expect(user.userID, "testuid");
  });
  //----------------------Getters and setters for username------------------------
  test('Username setter should correctly set the username data', () async {
    User user = new User(uid: "testuid", username: "testUsername", numberOfPosts: "12");
    user.username = "sampleUsername";
    expect(user.username, "sampleUsername");
  });

  test('Username getter should correctly retrieve the username', () async {
    User user = new User(uid: "testuid", username: "testUsername", numberOfPosts: "12");

    expect(user.username, "testUsername");
  });
  //----------------------Getters and setters for numberOfPosts------------------------
  test('Number of posts setter should correctly set the number of posts', () async {
    User user = new User(uid: "testuid", username: "testUsername", numberOfPosts: "12");
    user.numberOfPosts = "20";
    expect(user.numberOfPosts, "20");
  });

  test('Number of posts getter should correctly return the number of posts', () async {
    User user = new User(uid: "testuid", username: "testUsername", numberOfPosts: "12");

    expect(user.numberOfPosts, "12");
  });
}