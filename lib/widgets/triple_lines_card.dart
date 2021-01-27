import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class TripleLinesCard extends StatelessWidget {
  final String title;
  final String priceValue;
  final IconData icon;

  const TripleLinesCard({this.title, this.priceValue, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: mainColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
            Text(
              priceValue,
              style: TextStyle(
                color: redColor,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
