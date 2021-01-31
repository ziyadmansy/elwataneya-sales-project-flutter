import 'package:elwataneya_sales_app/screens/main_layouts/login_screen.dart';
import 'package:elwataneya_sales_app/screens/more_screens/offers_screen.dart';
import 'package:elwataneya_sales_app/screens/more_screens/tasks_screen.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('عروض و مسابقات'),
          subtitle: Text('العروض و المسابقات اليومية'),
          leading: Icon(
            Icons.card_giftcard_outlined,
            color: mainColor,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(OffersScreen.ROUTE_NAME);
          },
        ),
        Divider(),
        ListTile(
          title: Text('المهمات'),
          subtitle: Text('المهمات المطلوب تنفيذها'),
          leading: Icon(
            Icons.assignment_outlined,
            color: mainColor,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(TasksScreen.ROUTE_NAME);
          },
        ),
        Divider(),
        ListTile(
          title: Text('عن التطبيق'),
          subtitle: Text('معلومات عن منشأ التطبيق'),
          leading: Icon(
            Icons.info_outline,
            color: mainColor,
          ),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('تسجيل الخروج'),
          subtitle: Text('للخروج من الحساب'),
          leading: Icon(
            Icons.exit_to_app_outlined,
            color: mainColor,
          ),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              LoginScreen.ROUTE_NAME,
              ModalRoute.withName('/'),
            );
          },
        ), 
      ],
    );
  }
}
