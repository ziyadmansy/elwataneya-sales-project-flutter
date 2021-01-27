import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/card_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 16.0,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 6,
                backgroundColor: Colors.grey,
              ),
              Text(
                'خط اكتوبر الشيخ حسن',
                style: ktitleTextStyle,
              ),
              Text(
                'مندوب مبيعات',
                style: ksubtitleTextStyle,
              ),
              Divider(),
              Text(
                'التقرير اليومى',
                style: ktitleTextStyle,
              ),
              Divider(
                indent: MediaQuery.of(context).size.width / 4,
                endIndent: MediaQuery.of(context).size.width / 4,
              ),
              CardTile(
                title: 'الزيارات',
                leadingIcon: Icons.money_outlined,
                trailingText: '71',
              ),
              CardTile(
                title: 'الهدف اليومى',
                leadingIcon: Icons.show_chart,
                trailingText: '100',
              ),
              CardTile(
                title: 'الهدف الشهرى',
                leadingIcon: Icons.stacked_line_chart,
                trailingText: '500',
              ),
              CardTile(
                title: 'الزيارات',
                leadingIcon: Icons.tour_outlined,
                trailingText: '71',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
