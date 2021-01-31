import 'package:dio/dio.dart';
import 'package:elwataneya_sales_app/models/debt_employee.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/foundation.dart';

class Debts with ChangeNotifier {
  final String uid;

  Debts(this.uid);

  String total = '';
  List<DebtEmployee> _debtEmployees = [];

  List<DebtEmployee> get debtEmployees {
    return _debtEmployees;
  }

  Future<void> getDebtsData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        '$API_URL/ListDebtors',
        data: {
          'agent': uid,
        },
      );
      final Map<String, dynamic> responseData = response.data;
      print(responseData);
      total = responseData['total'];
      _debtEmployees = (responseData['debtors'] as List<dynamic>).map((debtor) {
        return DebtEmployee(
          id: debtor['client'],
          name: debtor['clientName'],
          phone: debtor['clientMobile'],
          amount: debtor['amount'],
          lon: debtor['longitude'],
          lat: debtor['latitude'],
        );
      }).toList();
      notifyListeners();
    } on DioError catch (error) {
      print('getDebtsData dio error: ' + error.message);
      throw 'برجاء التأكد من وجود شبكة إنترنت و إعادة المحاولة';
    } catch (error) {
      print('getDebtsData catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
