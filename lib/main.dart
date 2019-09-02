import 'dart:async';

import 'package:flutter/material.dart';
import 'package:posts_app/page/home.dart';

import 'Controller/postController.dart';
import 'model/post.dart';

void main() => runApp(MyApp(posts: fetchPost()));

class MyApp extends StatelessWidget {
  final Future<List<Post>> posts;

  MyApp({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
   );
  }
}
