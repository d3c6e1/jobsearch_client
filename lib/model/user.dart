import 'package:jobsearch_client/model/model.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String additionalName;
  String email;
  String phoneNumber;
  String city;
  DateTime birthDate;
  String username;
  List<CV> cvs;
  List<DocumentFile> documents;
  Organization organization;
  AuthorizationToken token;

  User({this.id, this.email, this.firstName, this.lastName, this.username,
    this.phoneNumber, this.birthDate, this.city, this.additionalName,
    this.cvs, this.organization, this.documents});

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    additionalName = map['additionalName'];
    phoneNumber = map['phoneNumber'];
    city = map['city'];
    if(map['birthDate'] != null) {
      birthDate = DateTime.parse(map['birthDate']);
    }

    if (map.containsKey('cvs') && map['cvs'] != null) {
      cvs = List<CV>();
      map['cvs'].forEach((cv) {
        cvs.add(CV.fromMap(cv));
      });
    }

    if (map.containsKey('documents') && map['documents'] != null) {
      documents = List<DocumentFile>();
      map['documents'].forEach((docFile) {
        documents.add(DocumentFile.fromMap(docFile));
      });
    }

    organization = map.containsKey('organization') && map['organization'] != null
        ? Organization.fromMap(map['organization'])
        : null;

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
      'phoneNumber': phoneNumber,
      'city': city,
      'birthDate': birthDate,
      'organization': organization != null ?
          organization.asMap() :
          null,
      'cvs': cvs != null ?
          cvs.map((cv) => cv.asMap()).toList() :
          null,
      'documents': documents != null ?
          documents.map((docFile) => docFile.asMap()).toList() :
          null,
    };
}