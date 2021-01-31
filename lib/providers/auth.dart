import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/foundation.dart';

class Auth extends ChangeNotifier {
  String uid;
  String name;
  String status;

  Future<void> loginUser(String phone, String password) async {
    try {
      Dio dio = Dio();
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
}
