import 'package:flutter/material.dart';

class FinancesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('الفواتير'),
          subtitle: Text('تفاصيل فواتير العملاء'),
          leading: Icon(Icons.receipt_outlined),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('كشف حساب'),
          subtitle: Text('كشف حساب الموزع بالتفصيل'),
          leading: Icon(Icons.receipt_long_outlined),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text('رصيد السيارة'),
          subtitle: Text('رصيد حمولة السيارة بالتفصيل'),
          leading: Icon(Icons.local_shipping_outlined),
          onTap: () {},
        ),
      ],
    );
  }
}