import 'package:feeder/src/com/hht/models/user.dart';
import 'package:feeder/src/com/hht/service/user_service.dart';
import 'package:scoped_model/scoped_model.dart';

mixin UserModel on Model {
  UserService _userService = UserService();
  bool _isMatch = true;
  bool isUserLoading = false;
  User _authUser;

  User get authUser {
    return _authUser;
  }

  Future<bool> login(String username, String password) async {
    isUserLoading = true;
    notifyListeners();
    _authUser = await _userService.login(username, password);
    _isMatch = _authUser == null ? false : true;
    isUserLoading = false;
    notifyListeners();
    return Future.value(_isMatch);
  }

  Future<Map<String, dynamic>> signup(
      String email, String username, String password) {
    return _userService.signup(
        email: email, username: username, password: password);
  }
}
