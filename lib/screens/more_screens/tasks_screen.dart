import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/triple_lines_card.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/tasksScreen';
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المهمات',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TripleLinesCard(
                    title: 'عدد المهمات',
                    priceValue: 1035.toString(),
                    icon: Icons.menu,
                  ),
                ),
                Expanded(
                  child: TripleLinesCard(
                    title: 'مهمات تامة',
                    priceValue: 23035.toString(),
                    icon: Icons.done_all,
                  ),
                ),
                Expanded(
                  child: TripleLinesCard(
                    title: 'مهمات مطلوبة',
                    priceValue: 3.toString(),
                    icon: Icons.record_voice_over_outlined,
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
