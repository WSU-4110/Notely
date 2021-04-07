import 'package:flutter/material.dart';
import 'package:Notely/models/Post.dart';



openPostview(context, Post _post) {
  Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostviewPage(_post)));

}

class PostviewPage extends StatelessWidget {

  Post post;

  PostviewPage(Post _post) {
    post = _post;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        ),
    );
  }
}



// class Pageview extends StatefulWidget {
//   @override
//   _PageviewState createState() => _PageviewState();
// }

// class _PageviewState extends State<Pageview> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
// 
// 
// 
// 