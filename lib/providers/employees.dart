import 'package:dio/dio.dart';
import 'package:elwataneya_sales_app/models/employee.dart';
import 'package:elwataneya_sales_app/models/employee_area.dart';
import 'package:elwataneya_sales_app/models/employee_category.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Employees with ChangeNotifier {
  final String uid;
  Employees(this.uid);

  List<Employee> _employees = [];

  List<EmployeeArea> _employeeAreas = [];
  List<EmployeeCategory> _employeeCategories = [];

  List<Employee> get employees {
    return _employees;
  }

  List<EmployeeArea> get employeeAreas {
    return _employeeAreas;
  }

  List<EmployeeCategory> get employeeCategories {
    return _employeeCategories;
  }

  Dio dio = Dio();

  Future<void> getEmployees(int type) async {
    // type: 1 = inside route,
    // else = outside route
    try {
      Response response = await dio.post(
        '$API_URL/ListClients',
        data: {
          'agent': uid,
          'type': type,
        },
      );
      final List<dynamic> responseData = response.data;
      _employees = responseData.map((emp) {
        return Employee(
          id: emp['id'],
          name: emp['clientName'],
          phone: emp['clientMobile'],
          respName: emp['respName'],
          respPhone: emp['respMobile'],
          area: emp['area'],
          lat: emp['latitude'],
          lon: emp['longitude'],
          code: emp['code'],
          todayBill: emp['todayBill'],
        );
      }).toList();
      notifyListeners();
    } on DioError catch (error) {
      print('getEmployees dio error: ' + error.message);
      throw 'برجاء التأكد من وجود شبكة إنترنت و إعادة المحاولة';
    } catch (error) {
      print('getEmployees catch error: ' + error.toString());
      throw error.toString();
    }
  }

  Future<void> getNewEmployeeOptions() async {
    try {
      Response response = await dio.post(
        '$API_URL/NewClientOptions',
        data: {
          'agent': uid,
        },
      );
      final Map<String, dynamic> responseData = response.data;
      _employeeAreas = (responseData['areas'] as List<dynamic>).map((area) {
        return EmployeeArea(
          id: area['id'],
          name: area['name'],
          governorate: area['government'],
        );
      }).toList();
      _employeeCategories =
          (responseData['categories'] as List<dynamic>).map((cat) {
        return EmployeeCategory(
          id: cat['id'],
          name: cat['name'],
        );
      }).toList();
      notifyListeners();
    } on DioError catch (error) {
      print('getNewEmployeeOptions dio error: ' + error.message);
      throw 'برجاء التأكد من وجود شبكة إنترنت و إعادة المحاولة';
    } catch (error) {
      print('getNewEmployeeOptions catch error: ' + error.toString());
      throw error.toString();
    }
  }

  Future<void> saveNewClient(Map<String, dynamic> newClient) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      Response response = await dio.post(
        '$API_URL/SaveNewClient',
        data: {
          'agent': uid,
          'area': newClient['area'],
          'name': newClient['name'],
          'mobile': newClient['mobile'],
          'address': newClient['address'],
          'category': newClient['category'],
          'visitDay': newClient['visitDay'],
          'target': newClient['target'],
          'latitude': position.latitude,
          'longitude': position.longitude,
          'curTime': newClient['curTime'],
        },
      );
      print(response.data);
    } on DioError catch (error) {
      print('saveNewClient dio error: ' + error.message);
      throw 'برجاء التأكد من وجود شبكة إنترنت و إعادة المحاولة';
    } catch (error) {
      print('saveNewClient catch error: ' + error.toString());
      throw error.toString();
    }
  }
}
