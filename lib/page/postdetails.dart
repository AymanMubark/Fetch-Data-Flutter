import 'package:flutter/material.dart';
import 'package:posts_app/model/post.dart';

class PostDetails extends StatefulWidget {
  final Post post;
  PostDetails(this.post);

  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.post.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FadeInImage.assetNetwork(
                image: widget.post.url,
                placeholder: 'assets/images/noimage.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
