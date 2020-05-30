import 'package:jobsearch_client/model/model.dart';

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String username;
  AuthorizationToken token;
  String phoneNumber;
  String city;
  Map<String, dynamic> socialNetworks = Map<String, dynamic>();
  DateTime birthDate;
  List<CV> cvs = List<CV>();


  User({this.id, this.email, this.firstName, this.lastName, this.username});

  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    email = map["email"];
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    cvs = map['cvs'];

    if (map.containsKey("token")) {
      token = AuthorizationToken.fromMap(map["token"]);
    }
  }

  bool get isAuthenticated => token != null && !token.isExpired;

  Map<String, dynamic> asMap() =>
    {
      'id': id,
      'username': username,
      'email': email,
      'token': token.asMap(),
      'firstName': firstName,
      'lastName': lastName,
      'cvs': cvs,
    };
}