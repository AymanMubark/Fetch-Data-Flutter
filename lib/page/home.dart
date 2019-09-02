import 'package:flutter/material.dart';
import 'package:posts_app/Controller/postController.dart';
import 'package:posts_app/model/post.dart';
import 'package:posts_app/page/postdetails.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Post>> posts;
  _HomePageState() {
    posts = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostDetails(snapshot.data[index])),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeInImage.assetNetwork(
                            image: snapshot.data[index].url,
                            placeholder: 'assets/images/noimage.png',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.share),
                                onPressed: () {
                    
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.save),
                                onPressed: () {
                                  saveNetworkImageToPhoto(
                                      snapshot.data[index].url,snapshot.data[index].title).then((value){
                                        
                                      });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
