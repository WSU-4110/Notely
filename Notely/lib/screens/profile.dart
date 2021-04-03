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
                height: 200,
                width: 375,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade400, width: 2, style: BorderStyle.solid),
                  ),
                ),
                child: Row( //displays the username, follow button, profile pic, and the num of posts, likes, and followers
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Container( 
                      height: 75,
                      width: 375,
                      child: Column( //displays username, follow button, and the num of posts, likes, and followers
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Container( //displays the username
                          height: 50,
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              Container(
                                height: 50,
                                width: 150,
                                child: Center(
                                  child: Text(userInfo.username, 
                                  style: TextStyle(fontSize: 20,),
                                  ),
                                ),
                              ),
                              Container( //displays follow button
                                height: 50,
                                width: 150,
                                child: Center(
                                  child: Text("BUTTON HERE",
                                  style: TextStyle(fontSize: 20,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ),
                          Container( //displays the number of posts, likes, and followers
                            height: 25,
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Container( //displays number of posts
                                  height: 25,
                                  width: 100,
                                  child: Center(
                                    child: Text("posts"),
                                  ),
                                ),
                                Container( //displays number of likes
                                  height: 25,
                                  width: 100,
                                  child: Center(
                                    child: Text("likes"),
                                  ),
                                ),
                                Container( //displays number of followers
                                  height: 25,
                                  width: 100,
                                  child: Center(
                                    child: Text("followers"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
                    ),
                    Container( //displays users profile image
                      // height: 75,
                      // width: 75,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.tealAccent.shade400,
                          radius: 25.0,
                          ),
                        ),
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