import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final Color mainColor = Colors.lightBlue[900];
final Color redColor = Colors.redAccent[700];
final Color greenColor = Colors.greenAccent[700];

const kappBarIconTheme = IconThemeData(color: Colors.grey);

const String API_URL = 'https://elwatanyagroup.com/system/api';

final appLoader = SpinKitDoubleBounce(
  color: mainColor,
  size: 40.0,
);

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
