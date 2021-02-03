import 'package:elwataneya_sales_app/providers/auth.dart';
import 'package:elwataneya_sales_app/screens/main_layouts/main_layout_screen.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/rounded_rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/loginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final _loginFormKey = GlobalKey<FormState>();

  String phoneNumber = '';
  String password = '';

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(errorMessage),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    final isValid = _loginFormKey.currentState.validate();
    if (isValid) {
      try {
        _loginFormKey.currentState.save();

        setState(() {
          _isLoading = true;
        });

        FocusScope.of(context).unfocus();

        final authData = Provider.of<Auth>(context, listen: false);
        await authData.loginUser(phoneNumber, password);
        // if (mounted) {
        //   setState(() {
        //     _isLoading = false;
        //   });
        // }
        // Navigator.of(context).pushReplacementNamed(MainLayoutScreen.ROUTE_NAME);
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog(error.toString());
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: MediaQuery.of(context).size.width / 5,
                  ),
                  kverticalSpace16,
                  Text(
                    'El Wataniya Sales',
                    style: ktitleTextStyle,
                  ),
                  kverticalSpace32,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'رقم الموبايل',
                      labelText: 'رقم الموبايل',
                      enabledBorder: ktextFieldEnabledBorder,
                      focusedBorder: ktextFieldFocusedBorder,
                    ),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'برجاء إدخال رقم الموبايل';
                      } else if (text.length < 11) {
                        return 'برجاء إدخال رقم صحيح';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (text) {
                      phoneNumber = text;
                    },
                  ),
                  kverticalSpace16,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'كلمة السر',
                      labelText: 'كلمة السر',
                      enabledBorder: ktextFieldEnabledBorder,
                      focusedBorder: ktextFieldFocusedBorder,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty) {
                        return 'برجاء إدخال كلمة السر';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (text) {
                      password = text;
                    },
                  ),
                  kverticalSpace32,
                  RoundedRectangleButton(
                    btnText: _isLoading ? 'جارى تسجيل الدخول' : 'تسجيل دخول',
                    btnColor: mainColor,
                    btnTextColor: Colors.white,
                    btnPressed: _isLoading ? null : _login,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
