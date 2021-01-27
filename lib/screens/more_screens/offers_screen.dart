import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/offersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'عروض و مسابقات',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'مسابقة',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.emoji_events,
                          color: Colors.red,
                          size: 40,
                        ),
                      ],
                    ),
                    Text(
                      'عرض بتنجانة بتمن بطاطساية',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('من: '),
                          Text('إلى: '),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
