import 'package:elwataneya_sales_app/screens/finances_screens/debts_Screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/bills_Screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/car_bills_screen.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class FinancesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('الفواتير'),
          subtitle: Text('تفاصيل فواتير العملاء'),
          leading: Icon(Icons.receipt_outlined,
            color: mainColor,),
          onTap: () {
            Navigator.of(context).pushNamed(BillsScreen.ROUTE_NAME);
          },
        ),
        Divider(),
        ListTile(
          title: Text('كشف حساب'),
          subtitle: Text('كشف حساب الموزع بالتفصيل'),
          leading: Icon(Icons.receipt_long_outlined,
            color: mainColor,),
          onTap: () {
            Navigator.of(context).pushNamed(DebtsScreen.ROUTE_NAME);
          },
        ),
        Divider(),
        ListTile(
          title: Text('رصيد السيارة'),
          subtitle: Text('رصيد حمولة السيارة بالتفصيل'),
          leading: Icon(Icons.local_shipping_outlined,
            color: mainColor,),
          onTap: () {
            Navigator.of(context).pushNamed(CarBillScreen.ROUTE_NAME);
          },
        ),
      ],
    );
  }
}
