import 'dart:io';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/utils.dart';

class UserService extends ServiceController<User> {
  UserService(this.store);

  Store store;

  void logout() {
    store.authenticatedUser = null;
    add(null);
  }

  Future<User> login(String username, String password) async {
    var req = new Request.post("/auth/token", {
      "username": username,
      "password": password,
      "grant_type": "password"
    }, contentType: new ContentType("application", "x-www-form-urlencoded"));

    var response = await store.executeClientRequest(req);
    if (response.error != null) {
      addError(response.error);
      return null;
    }

    switch (response.statusCode) {
      case 200: return getAuthenticatedUser(token: new AuthorizationToken.fromMap(response.body));
      default: addError(new APIError(response.body["error"]));
    }

    return null;
  }

  Future<User> register(String username, String password, String email, String fName, String lName,) async {
    Request req = Request.post(
        "/register", {
          "username": username,
          "password": password,
          "email": email,
          "firstName": fName,
          "lastName": lName,
        });

    Response response = await store.executeClientRequest(req);
    if (response.error != null) {
      addError(response.error);
      return null;
    }

    switch (response.statusCode) {
      case 200: return getAuthenticatedUser(token: new AuthorizationToken.fromMap(response.body));
      case 409: addError(new APIError("User already exists")); break;
      default: addError(new APIError(response.body["error"]));
    }

    return null;
  }

  Future<User> getAuthenticatedUser({AuthorizationToken token}) async {
    var req = new Request.get("/profile");
    var response = await store.executeUserRequest(req, token: token);

    if (response.error != null) {
      addError(response.error);
      return null;
    }

    switch (response.statusCode) {
      case 200: {
        var user = new User.fromMap(response.body)
          ..token = token;
        add(user);

        return user;
      } break;

      default: addError(new APIError(response.body["error"]));
    }

    return null;
  }
}


//  Future<User> loginUser(String email, String password) async{
//    final Response response = await post(
//      loginURL,
//      headers: <String, String>{
//        'Content-Type' : 'application/json'
//      },
//      body: jsonEncode(<String, String>{
//        "email": email,
//        "password": password,
//      }),
//    );
//    if (response.statusCode == 201) {
//      // If the server did return a 201 CREATED response,
//      // then parse the JSON.
//      return User.fromJson(json.decode(response.body));
//    } else {
//      // If the server did not return a 201 CREATED response,
//      // then throw an exception.
//      throw Exception('Failed to register user');
//    }
//  }
//
//  Future<User> registerUser(String email, String fName,
//      String lName, String password) async {
//    final Response response = await post(
//      registerURL,
//      headers: <String, String>{
//        'Content-Type' : 'application/json'
//      },
//      body: jsonEncode(<String, String>{
//        "firstName": fName,
//        "lastName": lName,
//        "email": email,
//        "username" : email,
//        "password": password,
//      }),
//    );
//    if (response.statusCode == 201) {
//      // If the server did return a 201 CREATED response,
//      // then parse the JSON.
//      return User.fromJson(json.decode(response.body));
//    } else {
//      // If the server did not return a 201 CREATED response,
//      // then throw an exception.
//      throw Exception('Failed to register user');
//    }
//  }
