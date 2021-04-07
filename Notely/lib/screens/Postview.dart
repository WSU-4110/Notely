import 'package:flutter/material.dart';
import 'package:Notely/models/DemoPosts.dart';



openPostview(context, DemoPost _post) {
  Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostviewPage(_post)));

}

class PostviewPage extends StatelessWidget {

  DemoPost post;

  PostviewPage(DemoPost _post) {
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