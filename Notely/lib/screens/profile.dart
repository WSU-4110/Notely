import 'package:Notely/models/user.dart';
import 'package:flutter/material.dart';
import 'package:Notely/services/database.dart';
import 'package:provider/provider.dart';
import 'package:Notely/screens/settingsOptions/editprofile.dart';

class Profile {}

openProfile(context, User user) { //opens profile page from menu
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfilePage()));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  User userInfo = new User(numberOfPosts: 0, username: '');

  void getUserInfo(User user) async { //gets user information from the database
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
      appBar: AppBar( //displays the teal bar at the top of page
        title: Text('Profie Page'),
        elevation: 1,
        leading: IconButton( //'back' arrow that sends user to homepage when pressed
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){ //sends user back to homepage
            Navigator.pop(context);
          },
        ),
      ),
      body: Container( //contains all profile user information
        width: double.infinity,
        height: double.infinity,
        child: Column( //displays the user profile information as a whole
            mainAxisAlignment: MainAxisAlignment.start, //has column sit at top of page
            crossAxisAlignment: CrossAxisAlignment.center, // has column sit in the center
            children: <Widget> [
              Container(
                decoration: BoxDecoration(
                  border: Border( //creates the bottom border at the bottom of the profile information box
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
                                height: 70, //creates the height of the container containing the username
                                width: 150,  //creates the width of the container containing the username
                                alignment: Alignment.centerLeft, //sets the text to the left of the container and the center height-wise of the container
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 10), //makes so the text isn't against the very edge
                                  child: Text( //displays username
                                  userInfo.username, //username from database
                                  style: TextStyle(fontSize: 22,),
                                  ),
                                ),
                                ),
                              Container( //displays follow button
                                height: 70, //creates the hieght of the container containing the follow button
                                width: 150, //creates the width of the container containing the follow button
                                child: Container(
                                  alignment: Alignment.centerLeft, 
                                  child: RawMaterialButton( //the color of the button
                                    fillColor: Colors.tealAccent.shade400,
                                    splashColor: Colors.tealAccent.shade400,
                                    onPressed: () { //when pressed, the button takes user to profile page
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => EditProfile()));
                                    },
                                    child: Padding( 
                                      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0, bottom: 5.0 ), //sizes the area arround the button so the button doesn't fill entire container
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const[
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Text( //displays the button text
                                            "Edit Profile",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), //makes the button a rectangle with rounded edges
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
                                  height: 25, //height of the container displaying posts
                                  width: 100, //width of the container displaying posts
                                  child: Padding(
                                  padding: EdgeInsets.only(left: 10), //this is so the text isn't at the very edge
                                  child: RichText( 
                                    text: TextSpan( //displays the number of posts
                                      text: "70",
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: " posts"),
                                      ],
                                    ),
                                  ),
                                ),
                                ),
                                Container( //displays number of likes
                                  height: 25, //height of the container displaying likes
                                  width: 100, //width of the container displaying likes
                                  child: RichText(
                                    text: TextSpan( //displays the number of likes
                                      text: "420",
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: " likes"),
                                      ],
                                    ),
                                  ),
                                ),
                                Container( //displays number of followers
                                  height: 25, //height of the container displaying followers
                                  width: 100, //width of container displaying followers
                                  child: RichText(
                                    text: TextSpan( //displays the number of followers
                                      text: "13",
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: " followers"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
                    ),
                    Container( //displays users profile image
                      height: 95, //height of container displaying image
                      width: 75, //width of container displaying image
                      child: Center( //sets image in the center of the container
                        child: CircleAvatar(
                          backgroundImage: NetworkImage( //displays image
                            "https://cdn2.iconfinder.com/data/icons/facebook-51/32/FACEBOOK_LINE-01-512.png",
                          ),
                          radius: 25, //size of the radius of the image
                          ),
                        ),
                      ),
                  ],
                ),
                  ),
                  Container( //displays the name and school
                height: 30, //height of container displaying name and school
                width: 375, //width of container displaying name and school
                child: RichText(
                  text: TextSpan( //displays name and school
                    text: "Name ",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    children: [
                      WidgetSpan(child: Container( 
                        padding: EdgeInsets.only(bottom: 3,), 
                        child: Icon(Icons.circle, size: 15, color: Colors.tealAccent.shade400,), //creates an aesthetic circle to space apart the name and school
                        ),
                      ),
                      TextSpan(text: " School"),
                    ],
                  ),
                ),
              ),
              Container( //contains the about information of the user
                height: 50, //height of the container displaying the about
                width: 375, //width of the container displaying the about
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