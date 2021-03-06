import 'package:elwataneya_sales_app/enums/employees_route.dart';
import 'package:flutter/material.dart';

class EmployeesSearch extends SearchDelegate<String> {
  final EmplolyeesRoute arg;

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