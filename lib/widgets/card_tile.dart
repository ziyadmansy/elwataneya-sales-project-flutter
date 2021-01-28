import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailingText;
  final IconData leadingIcon;

  const CardTile(
      {this.title, this.trailingText, this.leadingIcon, this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(
            title,
          ),
          leading: Icon(
            leadingIcon,
            color: mainColor,
          ),
          subtitle: this.subtitle == '' ? null : Text(subtitle),
          trailing: CircleAvatar(
            backgroundColor: mainColor,
            radius: 28,
            child: FittedBox(
              child: Text(
                trailingText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
