import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class BillDetailsScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/billDetailsScreen';
  @override
  _BillDetailsScreenState createState() => _BillDetailsScreenState();
}

class _BillDetailsScreenState extends State<BillDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفواتير',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          'خط اكتوبر الشيخ حسن',
                          style: ktitleTextStyle,
                        ),
                        subtitle: Text('رقم الفاتورة'),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor: mainColor,
                          child: FittedBox(
                            child: const Text(
                              'المندوب',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          'يوسف البارودى',
                          style: ktitleTextStyle,
                        ),
                        subtitle: Text('التاريخ'),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor: mainColor,
                          child: FittedBox(
                            child: const Text(
                              'العميل',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Spacer(),
                    Text('السابق'),
                    Spacer(),
                    Text('0'),
                    Spacer(),
                  ],
                ),
              ),
              kverticalSpace16,
              FullWidthButton(
                btnText: 'طباعة الفاتورة',
                btnColor: mainColor,
                btnTextColor: Colors.white,
                btnIcon: Icons.print_outlined,
                onBtnPressed: () {},
              ),
              kverticalSpace16,
              FullWidthButton(
                btnText: 'إنهاء الفاتورة',
                btnColor: mainColor,
                btnTextColor: Colors.white,
                btnIcon: Icons.send,
                onBtnPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
