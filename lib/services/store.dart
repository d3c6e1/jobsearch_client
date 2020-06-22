import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/services/services.dart';

class Store {
  Store({this.storageProvider}) {
    cvController = CVService(this);
    userController = UserService(this)
      ..listen((u) {
        if (u?.id != authenticatedUser?.id) {
          authenticatedUser = u;
        }
      });

    _loadPersistentUser();
  }

  static Store instance = Store();

  UserService userController;
  CVService cvController;

  static const String _clientID = 'com.jobsearch.client';
  String get clientAuthorization => "Basic ${const Base64Encoder().convert("$_clientID:".codeUnits)}";

  User get authenticatedUser => _authenticatedUser;
  set authenticatedUser(User u) {
    _authenticatedUser = u;
    if (u != null) {
      storageProvider?.store(_storedUserKey, json.encode(u.asMap()));
    } else {
      cvController.clearCache();
      storageProvider?.delete(_storedUserKey);
    }
  }

  Future<Response> executeClientRequest(Request request) async {
    request.headers[HttpHeaders.authorizationHeader] = clientAuthorization;
    return executeRequest(request);
  }

  Future<Response> executeUserRequest(Request request, {AuthorizationToken token}) async {
    AuthorizationToken t = token ?? authenticatedUser?.token;

    if (t?.isExpired ?? true) {
      throw UnauthenticatedException();
    }

    request.headers[HttpHeaders.authorizationHeader] = t.authorizationHeaderValue;
    var response = await executeRequest(request);

    if (response.statusCode == 401) {
      // Refresh the token, try again
    }

    return response;
  }

  Future<Response> executeRequest(Request request) async {
    try {
      if (request.method == "GET") {
        return Response.fromHTTPResponse(
            await http.get(_baseURL + request.path, headers: request.headers));
      } else if (request.method == "POST") {
        var body = request.body;
        if (request.contentType == ContentType.json) {
          body = json.encode(body);
        } else if (request.contentType.primaryType == "application"
            && request.contentType.subType == "x-www-form-url-encoded") {
          body = (body as Map<String, String>).keys.map((k) => "$k=${Uri.encodeQueryComponent(body[k])}").join("&");
        }
        return Response.fromHTTPResponse(
            await http.post(_baseURL + request.path, headers: request.headers, body: body));
      }
    } catch (e) {
      return new Response.failed(e);
    }
    throw 'Unsupported HTTP method';
  }

  /* Private */

  final StorageProvider storageProvider;
  String _baseURL = "https://jobsearch-dart.herokuapp.com";
  User _authenticatedUser;
  String get _storedUserKey => "user.json";

  void _loadPersistentUser() {
    if (storageProvider != null) {
      storageProvider.load(_storedUserKey).then((contents) {
        try {
          authenticatedUser = User.fromMap(json.decode(contents));
          userController.add(authenticatedUser);
        } catch (_) {
          userController.add(null);
        }
      }).catchError((_) {
        userController.add(null);
      });
    } else {
      userController.add(null);
    }
  }
}

abstract class StorageProvider {
  Future<String> load(String pathOrKey);
  Future<bool> store(String pathOrKey, String contents);
  Future<bool> delete(String pathOrKey);
}

class Request {
  Request.get(this.path) {
    method = "GET";
  }
  Request.post(this.path, this.body, {ContentType contentType}) {
    this.contentType = contentType ?? ContentType.json;
    method = "POST";
  }

  String method;
  String path;
  dynamic body;
  ContentType get contentType => _contentType;
  set contentType(ContentType t) {
    _contentType = t;
    if (_contentType != null) {
      headers[HttpHeaders.contentTypeHeader] = _contentType.mimeType;
    }
  }
  ContentType _contentType;
  Map<String, String> headers = {};
}

class Response {
  Response.fromHTTPResponse(http.Response response) {
    statusCode = response.statusCode;

    var contentType = ContentType.parse(response.headers[HttpHeaders.contentTypeHeader]);
    if (contentType.primaryType == "application" && contentType.subType == "json") {
      body = json.decode(response.body);
    }
  }

  Response.failed(this.error);

  int statusCode;
  dynamic body;
  Object error;
}

class UnauthenticatedException implements Exception {}

class APIError {
  APIError(this.reason) {
    reason ??= "Unknown failure";
  }

  String reason;

  @override
  String toString() => reason;
}