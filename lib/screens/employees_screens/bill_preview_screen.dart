import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class BillPreviewScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/billPreviewScreen';
  @override
  _BillPreviewScreenState createState() => _BillPreviewScreenState();
}

class _BillPreviewScreenState extends State<BillPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' تفاصيل الفاتورة',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              Card(
                elevation: kcardElevation,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              '2021/01/28',
                              style: ksubtitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'عميل رقم',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '0000002',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'المندوب',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'مصطفى يوسف',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'العميل',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'مصطفى يوسف',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'المنطقة',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'حلوان',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                child: Center(
                  child: Text('el gadwal hena'),
                ),
              ),
              Card(
                elevation: kcardElevation,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'السابق',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '0 جنيه',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'اليوم',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '1100 جنيه',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'المطلوب',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '1100 جنيه',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'المدفوع',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '--',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'المتبقى',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '1100 جنيه',
                            style: TextStyle(
                              color: redColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              kverticalSpace32,
              FullWidthButton(
                btnText: 'دفع',
                btnColor: greenColor,
                btnTextColor: Colors.white,
                btnIcon: Icons.attach_money,
                onBtnPressed: () {},
              ),
              kverticalSpace16,
              FullWidthButton(
                btnText: 'حفظ الفاتورة',
                btnColor: mainColor,
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
