class Post {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Post({this.albumId, this.id, this.title, this.url,this.thumbnailUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

}
