import 'package:extended_image/extended_image.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:posts_app/model/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'https://jsonplaceholder.typicode.com/photos/';

Future<List<Post>> fetchPost() async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    final result = json.decode(response.body);

    List<Post> posts =
        result.map<Post>((model) => new Post.fromJson(model)).toList();
    return posts;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<String> saveNetworkImageToPhoto(String url, String title,
    {bool useCache: true}) async {
  var data = await getNetworkImageData(url, useCache: useCache);
  var filePath = await ImagePickerSaver.saveFile(fileData: data, title: title);
  return filePath;
}
