import 'package:jobsearch_client/model/model.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String additionalName;
  String email;
  String phoneNumber;
  String city;
  Map<String, dynamic> socialNetworks;
  DateTime birthDate;
  String username;
  List<CV> cvs;
  List<DocumentFile> documents;
  Organization organization;
  AuthorizationToken token;

  User({this.id, this.email, this.firstName, this.lastName, this.username,
    this.phoneNumber, this.birthDate, this.city, this.additionalName,
    this.socialNetworks, this.cvs, this.organization, this.documents});

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    additionalName = map['additionalName'];
    phoneNumber = map['phoneNumber'];
    city = map['city'];
    birthDate = map['birthDate'];



    if (map.containsKey('token')) {
      token = AuthorizationToken.fromMap(map['token']);
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
      'additionalName': additionalName,
      'cvs': cvs,
      'phoneNumber': phoneNumber,
      'city': city,
      'socialNetworks': socialNetworks,
      'birthDate': birthDate,
      'documents': documents,
      'organization': organization,
    };
}