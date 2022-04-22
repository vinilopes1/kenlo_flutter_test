import 'dart:convert';

List<Post> postFromJson(str) => List<Post>.from(str.map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        required this.id,
        required this.title,
        required this.comments,
        required this.user,
        required this.publicationHour,
        required this.image
    });

    int id;
    String title;
    int comments;
    String user;
    String publicationHour;
    String image;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        comments: json["comments"],
        user: json["user"].toString(),
        publicationHour: json["publication_hour"],
        image: json["image"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "comments": comments,
        "user": user,
        "publication_hour": publicationHour,
        "image": image
    };
}
