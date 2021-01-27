import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class NewEmployeeScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/newEmployeeScreen';
  @override
  _NewEmployeeScreenState createState() => _NewEmployeeScreenState();
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  int _selectedPlace;
  int _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إضافة عميل',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Text(
                    'بيانات العميل',
                    style: ktitleTextStyle,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'إسم العميل',
                      labelText: 'إسم العميل',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                    onSaved: (text) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'رقم تليفون العميل',
                      labelText: 'رقم تليفون العميل',
                    ),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                    onSaved: (text) {},
                  ),
                  kverticalSpace16,
                  Text(
                    'بيانات المسئول',
                    style: ktitleTextStyle,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'إسم المسئول',
                      labelText: 'إسم المسئول',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                    onSaved: (text) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'رقم تليفون المسئول',
                      labelText: 'رقم تليفون المسئول',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                    onSaved: (text) {},
                  ),
                  kverticalSpace16,
                  Text(
                    'بيانات عامة',
                    style: ktitleTextStyle,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'العنوان',
                      labelText: 'العنوان',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                    onSaved: (text) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'هدف العميل',
                      labelText: 'هدف العميل',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {},
                    onSaved: (text) {},
                  ),
                  kverticalSpace16,
                  DropdownButton<int>(
                    value: _selectedPlace,
                    hint: Text('المنطقة'),
                    isExpanded: true,
                    itemHeight: 64,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text('الإختيار الاول'),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text('الإختيار الثانى'),
                      ),
                    ],
                    onChanged: (int i) {
                      setState(() {
                        _selectedPlace = i;
                      });
                    },
                  ),
                  kverticalSpace16,
                  DropdownButton<int>(
                    value: _selectedCategory,
                    hint: Text('التصنيف'),
                    isExpanded: true,
                    itemHeight: 64,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text('التصنيف الاول'),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text('التصنيف الثانى'),
                      ),
                    ],
                    onChanged: (int i) {
                      setState(() {
                        _selectedCategory = i;
                      });
                    },
                  ),
                  kverticalSpace32,
                  FullWidthButton(
                    btnText: 'حفظ البيانات',
                    btnColor: mainColor,
                    btnTextColor: Colors.white,
                    btnIcon: Icons.save_outlined,
                    onBtnPressed: () {},
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
