class User {
  final String uid;
  final dynamic username;
  int numberOfPosts;
  final dynamic name;
  final dynamic school;

  User({this.uid, this.username, this.numberOfPosts, this.name, this.school});

  void incrementPosts(){
    this.numberOfPosts++;
  }

  int getNumberOfPosts(){
    return this.numberOfPosts;
  }

}
