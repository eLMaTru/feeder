import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/endpoints.dart';
import '../models/user.dart';


class UserService{


//login
Future<User> login(String username, String password){


    User user = User(id: '1', email: 'elmatru@hotmail.es', username: username, token: password);
  
    return Future.value(user);
}

//Signup
Future<Map<String, dynamic>> signup({String username, String email, String password}) async {
Map<String, String> userData = {
  'username': username,
  'email': email,
  'password': password
};

http.Response responset = await http.post(EndPoint.USER_SIGNUP_POST, 
body: convert.json.encode(userData), headers: {'Content-Type': 'application/json'});

  print(responset.body);
  return userData;
}


}

