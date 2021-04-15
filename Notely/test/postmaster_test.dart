import 'package:Notely/models/Postmaster.dart';
import 'package:Notely/models/Post.dart';
import 'package:test/test.dart';
import 'dart:math';

void main() {

  test('loadTestPosts() should populate postList', () {
    Postmaster postmasterObject = new Postmaster();
    postmasterObject.loadTestPosts();
    //postmaster has 1 or more posts in list
    expect((postmasterObject.postList.length != 0), true);
  });

  test('clearPostList() should delete all stored posts', () {
    Postmaster postmasterObject = new Postmaster();
    postmasterObject.loadTestPosts();
    postmasterObject.clearPostList();
    print("Number of post objects after clear: " + postmasterObject.postList.length.toString());
    //postList has at least 1 post object
    expect((postmasterObject.postList.length != 0), false);
  });

  group('getPost()', (){
    test('getPost() returns an object from postList', () {
      Postmaster postmasterObject = new Postmaster();
      postmasterObject.loadTestPosts();
      Post temp = postmasterObject.getPost(new Random().nextInt(4));
      //temp post object should not be null
      expect((temp != null), true);
    });

    test('getPost() throws an error, returns null', () {
      Postmaster postmasterObject = new Postmaster();
      postmasterObject.clearPostList();
      Post temp = postmasterObject.getPost(new Random().nextInt(4));
      //temp post object should be null
      expect((temp == null), true);
    });
  });

    test('addPost() will add additional objects to postList', () {
      Postmaster postmasterObject = new Postmaster();
      int postCount = 10;
      //Stores 10 post objects into postList
      for (int i = 0; i < postCount; ++i){
        postmasterObject.addPost(new Post("testpost", "", "", false, [], []));
      }
      print("Number of post objects after loop: " + postmasterObject.postList.length.toString());
    expect((postmasterObject.postList.length >= postCount), true);
  });

  test('removeReportedPosts() removes posts', () {
    Postmaster postmasterObject = new Postmaster();
    postmasterObject.loadTestPosts();
    int numOfPosts = postmasterObject.postList.length;
    
    //removing all posts with where post.reported == true
    postmasterObject.removeReportedPosts();
    print("Number of post objects after removal: " + postmasterObject.postList.length.toString());
    expect((postmasterObject.postList.length < numOfPosts), true);
  });

  group("getListByTag()", (){
      test('getListByTag() should return a list with a post object', () {
        Postmaster postmasterObject = new Postmaster();
        postmasterObject.loadTestPosts();
        List<Post> tempList = postmasterObject.getListByTag("Computers");
        print("Number of post objects returned: " + tempList.length.toString());
        //tempList will not be empty
        expect(tempList.isNotEmpty, true);
        //the first element of templist will contain the appropriate tag
        expect(tempList[0].tags.contains("Computers"), true);
      });

      test('getListByTag() should return an empty list', () {
        Postmaster postmasterObject = new Postmaster();
        postmasterObject.loadTestPosts();
        List<Post> tempList = postmasterObject.getListByTag("impossible search term");
        print("Number of post objects returned: " + tempList.length.toString());
        expect(tempList.isEmpty, true);
    });
  });
}