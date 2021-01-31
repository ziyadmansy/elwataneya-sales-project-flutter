import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elwataneya_sales_app/screens/bottom_nav_screens/employees_screen.dart';
import 'package:elwataneya_sales_app/screens/bottom_nav_screens/finances_screen.dart';
import 'package:elwataneya_sales_app/screens/bottom_nav_screens/more_screen.dart';
import 'package:elwataneya_sales_app/screens/bottom_nav_screens/profile_screen.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MainLayoutScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/mainLayoutScreen';
  @override
  _MainLayoutScreenState createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _bottomNavIndex = 0;

  List<Map<String, Object>> _bottomNavData = [];
  @override
  void initState() {
    _bottomNavData = [
      {
        'title': 'البيانات الشخصية',
        'body': ProfileScreen(),
      },
      {
        'title': 'العملاء',
        'body': EmployeesScreen(),
      },
      {
        'title': 'الماليات',
        'body': FinancesScreen(),
      },
      {
        'title': 'المزيد',
        'body': MoreScreen(),
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _bottomNavData[_bottomNavIndex]['title'],
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: _bottomNavData[_bottomNavIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        elevation: 12,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'البيانات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'العملاء',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'الماليات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'المزيد',
          ),
        ],
        onTap: (i) {
          setState(() {
            _bottomNavIndex = i;
          });
        },
      ),
    );
  }
}
