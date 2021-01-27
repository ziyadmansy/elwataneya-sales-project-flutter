import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class RouteEmployeesScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/RouteEmployeesScreen';
  @override
  _RouteEmployeesScreenState createState() => _RouteEmployeesScreenState();
}

class _RouteEmployeesScreenState extends State<RouteEmployeesScreen> {
  bool _isLoading = false;
  bool arg;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(
      Duration.zero,
      () {
        arg = ModalRoute.of(context).settings.arguments;
        setState(() {
          _isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isLoading
          ? null
          : AppBar(
              title: Text(
                arg ? 'داخل خط السير' : 'خارج خط السير',
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
                      delegate: EmployeesSearch(arg),
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
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('000153'),
                        Text(
                          'حسين',
                          style: ktitleTextStyle,
                        ),
                        Text(
                          'حسين البارودى',
                          style: ksubtitleTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.location_on,
                                color: mainColor,
                                size: 32.0,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.call,
                                color: Colors.green,
                                size: 32.0,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.attach_money,
                                color: Colors.indigo,
                                size: 32.0,
                              ),
                              onPressed: () {},
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

class EmployeesSearch extends SearchDelegate<String> {
  final bool arg;

  EmployeesSearch(this.arg);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.trim().isNotEmpty) {
            query = '';
          } else {
            close(context, query);
          }
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('حسين'),
          onTap: () {
            close(context, '7eseen');
          },
        ),
        ListTile(
          title: Text('العامرى'),
          onTap: () {
            close(context, 'el 3amry');
          },
        ),
        ListTile(
          title: Text('يوسف البارودى'),
          onTap: () {
            close(context, 'el baroody');
          },
        ),
      ],
    );
  }
}
