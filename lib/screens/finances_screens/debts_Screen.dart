import 'package:elwataneya_sales_app/models/debt_employee.dart';
import 'package:elwataneya_sales_app/providers/debts.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/debt_details_screen.dart';
import 'package:elwataneya_sales_app/search_delegates/account_debt_search.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class DebtsScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/debtsScreen';
  @override
  _DebtsScreenState createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {
  bool _isLoading = false;
  bool _hasCrashed = false;
  @override
  void initState() {
    super.initState();
    getDebtorsData();
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(errorMessage),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }

  Future<void> getDebtorsData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final debtEmployeesData = Provider.of<Debts>(context, listen: false);
      await debtEmployeesData.getDebtsData();
      setState(() {
        _isLoading = false;
        _hasCrashed = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasCrashed = true;
      });
      _showErrorDialog(error.toString());
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Toast.show(
        "تعذر إجراء الإتصال برجاء المحاولة فى وقت لاحق",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final debtEmployeesData = Provider.of<Debts>(context, listen: false);
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
      body: _isLoading
          ? Center(
              child: appLoader,
            )
          : _hasCrashed
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_outlined,
                        color: yellowColor,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        INTERNET_WARNING_MESSAGE,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      FlatButton(
                        onPressed: getDebtorsData,
                        child: const Text(
                          'Retry',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: debtEmployeesData.debtEmployees.length,
                        itemBuilder: (context, i) {
                          final debtor = debtEmployeesData.debtEmployees[i];
                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    debtor.name,
                                    style: ktitleTextStyle,
                                  ),
                                  Text(
                                    'المديونية ${debtor.amount} جنيه',
                                    style: ktitleTextStyle.copyWith(
                                      color: redColor,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                            onPressed: () async {
                                              await _makePhoneCall(
                                                  debtor.phone);
                                            },
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
                            debtEmployeesData.total,
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
