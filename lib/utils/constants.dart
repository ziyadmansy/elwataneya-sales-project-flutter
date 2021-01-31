import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final Color mainColor = Color(0xFF0071F2);
final Color redColor = Color(0xFFEA1601);
final Color greenColor = Color(0xFF64BC26);
final Color yellowColor = Color(0xFFFAD202);

const kappBarIconTheme = IconThemeData(color: Colors.grey);

const String API_URL = 'https://elwatanyagroup.com/system/api';

const String INTERNET_WARNING_MESSAGE =
    'برجاء التأكد من وجود شبكة الإنترنت و إعادة المحاولة';

final appLoader = SpinKitDoubleBounce(
  color: mainColor,
  size: 40.0,
);

const double kcardElevation = 4;

const kverticalSpace8 = SizedBox(
  height: 8.0,
);

const kverticalSpace16 = SizedBox(
  height: 16.0,
);

const kverticalSpace32 = SizedBox(
  height: 32.0,
);

final ktitleTextStyle = TextStyle(
  fontSize: 24.0,
  color: mainColor,
  fontWeight: FontWeight.bold,
);

const ksubtitleTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.grey,
);

const ktextFieldEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);

final ktextFieldFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: mainColor,
    width: 2,
  ),
);
