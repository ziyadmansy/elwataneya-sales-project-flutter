import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appLoader,
            kverticalSpace16,
            Text('جارى التحميل برجاء الإنتظار'),
          ],
        ),
      ),
    );
  }
}
