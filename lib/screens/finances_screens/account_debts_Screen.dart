import 'package:elwataneya_sales_app/search_delegates/account_debt_search.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AccountDebtScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/accountDebtScreen';
  @override
  _AccountDebtScreenState createState() => _AccountDebtScreenState();
}

class _AccountDebtScreenState extends State<AccountDebtScreen> {
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                title: Text(
                  'إجمالى المديونية',
                  style: TextStyle(
                    color: redColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.money,
                  color: mainColor,
                ),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundColor: mainColor,
                  child: FittedBox(
                    child: Text(
                      '62341',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                                  onPressed: () {},
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
        ],
      ),
    );
  }
}
