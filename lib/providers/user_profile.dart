import 'package:dio/dio.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/foundation.dart';

class UserProfile with ChangeNotifier {
  final String uid;

  UserProfile(this.uid);

  String today;
  String dScore;
  var dPercent;
  String month;
  String mScore;
  var mPercent;
  var vTarget;
  var vscore;
  var vpercent;
  var bills;
  String money;
  var allbills;
  String allmoney;

  Future<void> getProfileData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        '$API_URL/GetTarget',
        data: {
          'agent': uid,
        },
      );
      final Map<String, dynamic> responseData = response.data;
      print(responseData);
      today = responseData['today'];
      dScore = responseData['dscore'];
      dPercent = responseData['dpercent'];
      month = responseData['month'];
      mScore = responseData['mscore'];
      mPercent = responseData['mpercent'];
      vTarget = responseData['vtarget'];
      vscore = responseData['vscore'];
      vpercent = responseData['vpercent'];
      bills = responseData['bills'];
      money = responseData['money'];
      allbills = responseData['allbills'];
      allmoney = responseData['allmoney'];
      notifyListeners();
    } on DioError catch (error) {
      print('getProfileData dio error: ' + error.message);
      throw 'برجاء التأكد من وجود شبكة إنترنت و إعادة المحاولة';
    } catch (error) {
      print('getProfileData catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
