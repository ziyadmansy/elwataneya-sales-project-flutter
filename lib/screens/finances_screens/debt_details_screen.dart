import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/triple_lines_card.dart';
import 'package:flutter/material.dart';

class DebtDetailsScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/debtsDetailsScreen';
  @override
  _DebtDetailsScreenState createState() => _DebtDetailsScreenState();
}

class _DebtDetailsScreenState extends State<DebtDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'كشف حساب العميل',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'عادل نعيم',
              style: ktitleTextStyle,
            ),
            Row(
              children: [
                Expanded(
                  child: TripleLinesCard(
                    title: 'السابق',
                    priceValue: 1035.toString(),
                    icon: Icons.attach_money,
                  ),
                ),
                Expanded(
                  child: TripleLinesCard(
                    title: 'المشتريات',
                    priceValue: 23035.toString(),
                    icon: Icons.shopping_basket_outlined,
                  ),
                ),
                Expanded(
                  child: TripleLinesCard(
                    title: 'المدفوع',
                    priceValue: 3.toString(),
                    icon: Icons.receipt_long_outlined,
                  ),
                ),
                Expanded(
                  child: TripleLinesCard(
                    title: 'المدفوع',
                    priceValue: 3.toString(),
                    icon: Icons.receipt_long_outlined,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('000153'),
                            Text(
                              'مزايا ماركت',
                              style: ktitleTextStyle,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      'إجمالى: 541.50 ج',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      'دفع كاش',
                                      style: ksubtitleTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
