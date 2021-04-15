class User {
  String uid;
  dynamic username;
  dynamic numberOfPosts;

  User({this.uid, this.username, this.numberOfPosts});

  String get userID{
    return uid;
  }
  set userID(String userID){
    this.uid = userID;
  }

  dynamic get uName{
    return username;
  }
  set uName(dynamic uName){
    this.username = uName;
  }

  dynamic get numPosts{
    return numberOfPosts;
  }
  set numPosts(dynamic numPosts){
    this.numberOfPosts = numPosts;
  }
}
