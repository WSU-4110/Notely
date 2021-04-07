import 'package:Notely/models/user.dart';
import 'package:flutter/material.dart';
import 'package:Notely/services/database.dart';
import 'package:provider/provider.dart';

class Profile {}

openProfile(context, User user) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfilePage()));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  User userInfo = new User(numberOfPosts: 0, username: '');

  void getUserInfo(User user) async {
    User info;
    await DatabaseService(uid: user.uid).getUserData().then((value){
      info = new User(username: value.data["name"], numberOfPosts: value.data["numberOfPosts"]);
      setState(() {
        userInfo = info;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    getUserInfo(user);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profie Page'),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column( //displays the user profile information as a whole
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade400, width: 2, style: BorderStyle.solid),
                  ),
                ),
                child: Column(
                  children: <Widget> [
                  Container(
                child: Row( //displays the username, follow button, profile pic, and the num of posts, likes, and followers
                  children: <Widget> [
                    Container( 
                      child: Column( //displays username, follow button, and the num of posts, likes, and followers
                        children: <Widget> [
                          Container( //displays the username
                          child: Row(
                            children: <Widget> [
                              Container(
                                height: 50,
                                width: 150,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                  //userInfo.username,
                                  "Leahm", 
                                  style: TextStyle(fontSize: 22,),
                                  ),
                                ),
                                ),
                              Container( //displays follow button
                                height: 50,
                                width: 150,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      side: BorderSide(color: Colors.tealAccent.shade400),
                                    ),
                                  onPressed: () {},
                                  padding: EdgeInsets.all(5.0),
                                  color: Colors.white,
                                  textColor: Colors.tealAccent.shade400,
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(fontSize: 15)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ),
                          Container( //displays the number of posts, likes, and followers
                            child: Row(
                              children: <Widget> [
                                Container( //displays number of posts
                                  height: 25,
                                  width: 100,
                                  child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                  "posts",
                                  ),
                                ),
                                ),
                                Container( //displays number of likes
                                  height: 25,
                                  width: 100,
                                  child: Text(
                                    "likes",
                                    ),
                                ),
                                Container( //displays number of followers
                                  height: 25,
                                  width: 100,
                                  child: Text(
                                    "followers",
                                    ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
                    ),
                    Container( //displays users profile image
                      height: 75,
                      width: 75,
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://cdn2.iconfinder.com/data/icons/facebook-51/32/FACEBOOK_LINE-01-512.png",
                          ),
                          radius: 25,
                          ),
                        ),
                      ),
                  ],
                ),
                  ),
                  Container(
                height: 30,
                width: 375,
                child: Text("Name * School", style: TextStyle(fontSize: 17,),),
              ),
              Container(
                height: 50,
                width: 375,
                child: Text("Mechanical Engineer, Junior, likes to bike and does competitive jump-roping"),
                ),
                  ],
                ),
              ),
            ],
          ),
         ),
     );
  }
}