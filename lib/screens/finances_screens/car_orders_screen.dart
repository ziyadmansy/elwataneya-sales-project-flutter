import 'package:elwataneya_sales_app/screens/finances_screens/new_car_order.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class CarOrdersScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/carOrdersScreen';
  @override
  _CarOrdersScreenState createState() => _CarOrdersScreenState();
}

class _CarOrdersScreenState extends State<CarOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'طلبات التحميل',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text('رقم الطلب 3907'),
                      subtitle: Text('2021/01/28'),
                      leading: Icon(Icons.receipt_outlined),
                    ),
                  );
                },
              ),
            ),
            FullWidthButton(
              btnText: 'أضف طلب جديد',
              btnColor: mainColor,
              btnTextColor: Colors.white,
              btnIcon: Icons.add,
              onBtnPressed: () {
                Navigator.of(context).pushNamed(NewCarOrderScreen.ROUTE_NAME);
              },
            )
          ],
        ),
      ),
    );
  }
}
