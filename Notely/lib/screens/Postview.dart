import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Notely/models/Post.dart';

openPostview(context, Post _post) {
  Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostviewPage(_post)));

}

class PostviewPage extends StatefulWidget {

  Post post;
  PostviewPage(Post _post) {
    post = _post;
  }

  @override
  _PostviewPageState createState() => _PostviewPageState(post);
}

class _PostviewPageState extends State<PostviewPage> {
  Post post;

  _PostviewPageState(Post _post) {
    post = _post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        ),
        body: Container(alignment: Alignment.topCenter,
        child: Column(children: <Widget>[
            Row(children: <Widget>[
              Expanded(
              child: Image.network(post.images[0]),
            ),
            Expanded(
              child: Text("Author: " + post.author),
            ),
            Expanded(
              child: Text("Date Published: " + post.date),
            ),
            Expanded(
              child: Text("Tags: " + post.tagsToString())
            ),
          ],
         ),
        ]
       )
      )
    );
  }
}
