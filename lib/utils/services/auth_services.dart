import 'dart:convert';
import 'package:http/http.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/services/services.dart';

class AuthServices extends Services{
  Future<String> loginUser(String email, String password) async{
    var res = await post(
      loginURL,
      body: {
        "email": email,
        "password": password,
      },
    ).catchError((e){
      throw(e);
    });
    print(res.body);
    print(res.statusCode);
    if(res.statusCode == 200){
      print("ghdhg");
      Map json = jsonDecode(res.body);
      return "${json['message']}";
    }else{
      String msg = "";
      if(res.body.contains("html")){
        msg = "Server Error";
      }else{
        msg = jsonDecode(res.body)['message'];
      }
      return msg;
    }
  }

  Future<User> registerUser(String email, String fName,
      String lName, String password) async {
    final Response response = await post(
      registerURL,
      headers: <String, String>{
        'Content-Type' : 'application/json'
      },
      body: jsonEncode(<String, String>{
        "firstName": fName,
        "lastName": lName,
        "email": email,
        "username" : email,
        "password": password,
      })
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to register user');
    }
  }
}