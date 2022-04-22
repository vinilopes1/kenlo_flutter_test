import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {

    final String? id;
    final String? name;

    User({
      this.id,
      this.name,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
