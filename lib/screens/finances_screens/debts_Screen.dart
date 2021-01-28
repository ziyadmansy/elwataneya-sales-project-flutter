import 'package:elwataneya_sales_app/screens/finances_screens/debt_details_screen.dart';
import 'package:elwataneya_sales_app/search_delegates/account_debt_search.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class DebtsScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/debtsScreen';
  @override
  _DebtsScreenState createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'العملاء المدينين',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final searchResult = await showSearch(
                context: context,
                delegate: AccountDebtSearch(),
              );
              print(searchResult);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'حسين',
                          style: ktitleTextStyle,
                        ),
                        Text(
                          'المديونية 5000 جنيه',
                          style: ktitleTextStyle.copyWith(
                            color: redColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: mainColor,
                                    size: 32.0,
                                  ),
                                  onPressed: () {},
                                ),
                                Text('العنوان'),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.call,
                                    color: Colors.green,
                                    size: 32.0,
                                  ),
                                  onPressed: () {},
                                ),
                                Text('إتصال'),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.book_outlined,
                                    color: Colors.indigo,
                                    size: 32.0,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      DebtDetailsScreen.ROUTE_NAME,
                                    );
                                  },
                                ),
                                Text('فواتير'),
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
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'إجمالى المديونية',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '628341',
                  style: TextStyle(
                    color: redColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
