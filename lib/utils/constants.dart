import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final Color mainColor = Colors.lightBlueAccent[700];

const kappBarIconTheme = IconThemeData(color: Colors.grey);

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
  fontSize: 28.0,
  color: mainColor,
  fontWeight: FontWeight.bold,
);

const ksubtitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.grey,
);
