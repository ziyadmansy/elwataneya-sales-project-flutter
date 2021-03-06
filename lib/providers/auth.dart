import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  String uid;
  String name;
  String status;

  bool isAuth() {
    return uid != null;
  }

  Future<bool> tryLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(LOGGED_IN_KEY) ?? false;
    if (isLoggedIn) {
      uid = prefs.getString(UID_KEY);
      name = prefs.getString(NAME_KEY);
      status = prefs.getString(STATUS_KEY);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> loginUser(String phone, String password) async {
    try {
      Dio dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Response response = await dio.post(
        '$API_URL/AgentLogin',
        data: {
          'mobile': phone,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        print(responseData);
        status = responseData['status'];
        if (status == '0') {
          throw responseData['message'];
        }
        uid = responseData['agentId'];
        name = responseData['agentName'];
        await prefs.setString(UID_KEY, uid);
        await prefs.setString(NAME_KEY, name);
        await prefs.setString(STATUS_KEY, status);
        await prefs.setBool(LOGGED_IN_KEY, true);
        notifyListeners();
      }
    } on DioError catch (e) {
      print('loginUser dio error: ' + e.message);
      throw 'برجاء التأكد من وجود شبكة إنترنت و إعادة المحاولة';
    } catch (error) {
      print('loginUser catch error: ' + error.toString());
      throw error.toString();
    }
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = null;
    name = null;
    status = null;
    await prefs.clear();
    notifyListeners();
  }
}
