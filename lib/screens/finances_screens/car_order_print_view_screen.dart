import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class CarOrderPrintViewScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/carOrderPrintViewScreen';
  @override
  _CarOrderPrintViewScreenState createState() =>
      _CarOrderPrintViewScreenState();
}

class _CarOrderPrintViewScreenState extends State<CarOrderPrintViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مراجعة طلب التحميل',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text(
                    'المندوب مصطفى يوسف',
                    style: ktitleTextStyle,
                  ),
                  subtitle: Text('2021/01/28'),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              Container(
                height: 200,
                child: Center(child: Text('Gadwal hena')),
              ),
              FullWidthButton(
                btnText: 'حفظ الطلب',
                btnColor: greenColor,
                btnTextColor: Colors.white,
                btnIcon: Icons.save_outlined,
                onBtnPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
