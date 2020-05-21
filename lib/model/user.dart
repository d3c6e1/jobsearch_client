import 'package:jobsearch_client/model/model.dart';

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String username;
  AuthorizationToken token;

  User({this.id, this.email, this.firstName, this.lastName, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
    );
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    email = map["email"];
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];

    if (map.containsKey("token")) {
      token = AuthorizationToken.fromMap(map["token"]);
    }
  }

  bool get isAuthenticated => token != null && !token.isExpired;

  Map<String, dynamic> asMap() =>
    {
      "id": id,
      'username': username,
      "email": email,
      "token": token.asMap(),
      "firstName": firstName,
      "lastName": lastName,
    };
}