import 'dart:convert';
import 'package:read_rover/data/model/login_model.dart';

import 'package:get_storage/get_storage.dart';

class AuthUtils {
  AuthUtils._();
  static LoginModel userInfo = LoginModel();

  static Future<LoginModel> getUserInfo() async {
    final box = GetStorage();
    final value = box.read('user-data');
    if (value != null) {
      return LoginModel.fromJson(jsonDecode(value));
    } else {
      return LoginModel(); // Return an empty model or handle the null case as needed.
    }
  }

  static Future<void> saveUserInfo(LoginModel loginModel) async {
    final box = GetStorage();
    await box.write('user-data', jsonEncode(loginModel.toJson()));
    userInfo = loginModel;
  }

  // static Future<void> saveSignupUserInfo(SignupModel signupModel) async {
  //   final box = GetStorage();
  //   await box.write('user-data', jsonEncode(signupModel.toJson()));
  //   signupUserInfo = signupModel;
  // }

  static Future<void> clearUserInfo() async {
    final box = GetStorage();
    await box.remove('user-data');
  }

  static Future<bool> checkIfUserLoggedIn() async {
    final box = GetStorage();
    final isLogin = box.hasData('user-data');
    if (isLogin) {
      userInfo = await getUserInfo();
    }
    return isLogin;
  }
}
