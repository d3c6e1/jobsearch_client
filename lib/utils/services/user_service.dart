import 'dart:io';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/utils.dart';

class UserService extends ServiceController<User> {
  UserService(this.store);

  Store store;

  logout() {
    store.authenticatedUser = null;
    add(null);
  }

  Future<User> login(String username, String password) async {
    var req = Request.post("/auth/token", {
      "username": username,
      "password": password,
      "grant_type": "password"
    }, contentType: ContentType("application", "x-www-form-urlencoded"));

    var response = await store.executeClientRequest(req);
    if (response.error != null) {
      addError(response.error);
      return null;
    }

    switch (response.statusCode) {
      case 200: return getAuthenticatedUser(token: AuthorizationToken.fromMap(response.body));
      default: addError(APIError(response.body["error"]));
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
      case 200: return getAuthenticatedUser(token: AuthorizationToken.fromMap(response.body));
      case 409: addError(APIError("User already exists")); break;
      default: addError(APIError(response.body["error"]));
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

//    print(response.body);

    switch (response.statusCode) {
      case 200: {
        var user = User.fromMap(response.body)
          ..token = token;
        add(user);
        // TODO remove
        print(response.body);
        print(user.asMap());
        return user;
      } break;
      default: addError(APIError(response.body["error"]));
    }
    return null;
  }
}