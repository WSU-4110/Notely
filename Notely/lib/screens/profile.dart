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
      info = new User(username: value.data["username"], numberOfPosts: value.data["numberOfPosts"], name: value.data["name"], school: value.data["school"]);
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
                                height: 70,
                                width: 150,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                  userInfo.username,
                                  style: TextStyle(fontSize: 22,),
                                  ),
                                ),
                                ),
                              Container( //displays follow button
                                height: 70,
                                width: 150,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  //margin: EdgeInsets.only(top: 10.0, bottom: 20.0, right: 30.0),
                                  child: RawMaterialButton(
                                    fillColor: Colors.tealAccent.shade400,
                                    splashColor: Colors.tealAccent.shade400,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 20.0, bottom: 5.0 ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const[
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Text(
                                            "Follow",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                                  child: RichText(
                                    text: TextSpan(
                                      text: userInfo.getNumberOfPosts().toString(),
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: " posts"),
                                      ],
                                    ),
                                  ),
                                ),
                                ),
                                Container( //displays number of likes
                                  height: 25,
                                  width: 100,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "420",
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: " likes"),
                                      ],
                                    ),
                                  ),
                                ),
                                Container( //displays number of followers
                                  height: 25,
                                  width: 100,
                                  child: RichText(
                                    text: TextSpan(
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
                      height: 95,
                      width: 75,
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://pyxis.nymag.com/v1/imgs/a94/d93/a29f6dd865ae91425bb3b8289d4ba88cd9-01-dangelo-wallace-2.rvertical.w570.jpg",
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
                child: RichText(
                  text: TextSpan(
                    text: userInfo.name,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    children: [
                      WidgetSpan(child: Container( 
                        padding: EdgeInsets.only(bottom: 3,), 
                        child: Icon(Icons.circle, size: 15, color: Colors.tealAccent.shade400,),
                        ),
                      ),
                      TextSpan(text: userInfo.school),
                    ],
                  ),
                ),
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