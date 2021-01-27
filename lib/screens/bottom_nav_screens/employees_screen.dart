import 'package:elwataneya_sales_app/screens/employees_screens/route_employees.dart';
import 'package:elwataneya_sales_app/screens/employees_screens/new_employee_screen.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class EmployeesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('داخل خط السير'),
          subtitle: Text('العملاء الذين بداخل خط السير'),
          leading: Icon(Icons.location_on_outlined),
          onTap: () {
            Navigator.of(context).pushNamed(
              RouteEmployeesScreen.ROUTE_NAME,
              arguments: true,
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('خارج خط السير'),
          subtitle: Text('العملاء الذين خارج خط السير'),
          leading: Icon(Icons.map_outlined),
          onTap: () {
            Navigator.of(context).pushNamed(
              RouteEmployeesScreen.ROUTE_NAME,
              arguments: false,
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('إضافة عميل'),
          subtitle: Text('إضافة عميل جديد'),
          leading: Icon(Icons.supervised_user_circle_outlined),
          onTap: () {
            Navigator.of(context).pushNamed(NewEmployeeScreen.ROUTE_NAME);
          },
        ),
      ],
    );
  }
}
