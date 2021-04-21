class User {

  String uid;
  dynamic username;
  dynamic numberOfPosts;
  final dynamic name;
  final dynamic school;


  User({this.uid, this.username, this.numberOfPosts, this.name, this.school});

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

  void incrementPosts(){
    this.numberOfPosts++;
  }

  int getNumberOfPosts(){
    return this.numberOfPosts;
  }

}
