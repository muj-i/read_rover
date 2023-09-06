import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:read_rover/ui/auth/login_page.dart';
import 'package:read_rover/data/model/network_response.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/main.dart';

class NetworkCaller {
  final box = GetStorage();

  //get request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(
        Uri.parse(url),
        headers: {"token": AuthUtils.userInfo.accessToken.toString() //! ?? AuthUtils.signupUserInfo.accessToken.toString()
        },
      );
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 &&
          decodedResponse['status'] == 'success') {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        backToLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log('Error occurred during GET request: $e');
    }
    return const NetworkResponse(false, -1, null);
  }

  //post request
  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      log(body.toString());
      Response response = await post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "token": AuthUtils.userInfo.accessToken.toString() //! ?? AuthUtils.signupUserInfo.accessToken.toString()
          },
          body: jsonEncode(body));

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          backToLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log('Error occurred during POST request: $e');
    }
    return const NetworkResponse(false, -1, null);
  }

  Future<void> backToLogin() async {
    await AuthUtils.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        ReadRoverApp.navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);
  }
}
