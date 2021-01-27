import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('عروض و مسابقات'),
          leading: Icon(Icons.card_giftcard_outlined),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('المهمات'),
          leading: Icon(Icons.assignment_outlined),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('عن البرنامج'),
          leading: Icon(Icons.info_outline),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('تسجيل الخروج'),
          leading: Icon(Icons.exit_to_app_outlined),
          onTap: () {},
        ),
      ],
    );
  }
}
