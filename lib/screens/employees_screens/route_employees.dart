import 'package:elwataneya_sales_app/enums/employees_route.dart';
import 'package:elwataneya_sales_app/providers/employees.dart';
import 'package:elwataneya_sales_app/screens/employees_screens/employee_bill_Screen.dart';
import 'package:elwataneya_sales_app/screens/main_layouts/google_maps_screen.dart';
import 'package:elwataneya_sales_app/search_delegates/employee_search.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class RouteEmployeesScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/RouteEmployeesScreen';
  @override
  _RouteEmployeesScreenState createState() => _RouteEmployeesScreenState();
}

class _RouteEmployeesScreenState extends State<RouteEmployeesScreen> {
  bool _isLoading = false;
  bool _hasCrashed = false;

  EmplolyeesRoute routeType;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(
      Duration.zero,
      () {
        routeType = ModalRoute.of(context).settings.arguments;
        getEmployeesData();
      },
    );
    super.initState();
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

  Future<void> getEmployeesData() async {
    try {
      int employeeType = routeType == EmplolyeesRoute.Inside ? 1 : 2;
      final employeesData = Provider.of<Employees>(context, listen: false);
      await employeesData.getEmployees(employeeType);
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
      print('couln\'t launch $url');
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
    final employeesData = Provider.of<Employees>(context, listen: false);
    return Scaffold(
      appBar: _isLoading
          ? null
          : AppBar(
              title: Text(
                routeType == EmplolyeesRoute.Inside
                    ? 'داخل خط السير'
                    : 'خارج خط السير',
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
                      delegate: EmployeesSearch(routeType),
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
                        onPressed: getEmployeesData,
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
              : ListView.builder(
                  itemCount: employeesData.employees.length,
                  itemBuilder: (context, i) {
                    final employee = employeesData.employees[i];
                    return Card(
                      elevation: kcardElevation,
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              employee.code,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              employee.name,
                              style: ktitleTextStyle,
                            ),
                            Text(
                              employee.respName,
                              style: ksubtitleTextStyle,
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
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                          GoogleMapsScreen.ROUTE_NAME,
                                          arguments: {
                                            'lat': double.parse(employee.lat),
                                            'lon': double.parse(employee.lon),
                                          },
                                        );
                                      },
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
                                            'tel:${employee.phone}');
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
                                        Icons.attach_money,
                                        color: Colors.indigo,
                                        size: 32.0,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                          EmployeeBillScreen.ROUTE_NAME,
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
    );
  }
}
