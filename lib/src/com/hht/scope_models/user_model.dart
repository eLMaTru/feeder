import 'package:feeder/src/com/hht/service/user_service.dart';
import 'package:scoped_model/scoped_model.dart';


mixin UserModel on Model{
  UserService userService = UserService();



  Future<Map<String, dynamic>> signup(String email, String username, String password){
 
    return userService.signup(email: email, username: username, password: password);
  }
  
} 
