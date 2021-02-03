import 'package:elwataneya_sales_app/providers/employees.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class NewEmployeeScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/newEmployeeScreen';
  @override
  _NewEmployeeScreenState createState() => _NewEmployeeScreenState();
}

class _NewEmployeeScreenState extends State<NewEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  // works for employee options only not sending new employee request
  bool _isLoading = false;
  bool _hasCrashed = false;
  bool _isSending = false;

  String _selectedPlace;
  int _selectedCategory;

  Map<String, dynamic> employeeForm = {};

  @override
  void initState() {
    super.initState();
    getEmployeeOptions();
  }

  Future<void> getEmployeeOptions() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final employeesData = Provider.of<Employees>(context, listen: false);
      await employeesData.getNewEmployeeOptions();
      setState(() {
        _isLoading = false;
        _hasCrashed = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasCrashed = true;
      });
      _showErrorDialog(error.toString());
    }
  }

  Future<void> saveEmployeeForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid && _selectedPlace != null && _selectedCategory != null) {
      try {
        setState(() {
          _isSending = true;
        });
        _formKey.currentState.save();
        final employeesData = Provider.of<Employees>(context, listen: false);
        await employeesData.saveNewClient(employeeForm);
        Toast.show(
          "تم حفظ البيانات بنجاح",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
        );
        setState(() {
          _isSending = false;
        });
        Navigator.of(context).pop();
      } catch (error) {
        setState(() {
          _isSending = false;
        });
        _showErrorDialog(error.toString());
      }
    }
  }
  
  

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

  @override
  Widget build(BuildContext context) {
    final employeesData = Provider.of<Employees>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إضافة عميل',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: _isLoading
          ? Center(
              child: appLoader,
            )
          : _hasCrashed
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_outlined,
                        color: yellowColor,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        INTERNET_WARNING_MESSAGE,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      FlatButton(
                        onPressed: getEmployeeOptions,
                        child: const Text(
                          'Retry',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SafeArea(
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
                              validator: (text) {
                                if (text.isEmpty) {
                                  return 'برجاء إدخال البيانات المطلوبة';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (text) {
                                employeeForm['name'] = text;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'رقم تليفون العميل',
                                labelText: 'رقم تليفون العميل',
                              ),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              validator: (text) {
                                if (text.isEmpty) {
                                  return 'برجاء إدخال البيانات المطلوبة';
                                } else if (text.length < 11) {
                                  return 'برجاء إدخال البيانات صحيحة';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (text) {
                                employeeForm['mobile'] = text;
                              },
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
                              validator: (text) {
                                if (text.isEmpty) {
                                  return 'برجاء إدخال البيانات المطلوبة';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (text) {
                                // TODO: Not implemented in the API
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'رقم تليفون المسئول',
                                labelText: 'رقم تليفون المسئول',
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              validator: (text) {
                                if (text.isEmpty) {
                                  return 'برجاء إدخال البيانات المطلوبة';
                                } else if (text.length < 11) {
                                  return 'برجاء إدخال البيانات صحيحة';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (text) {
                                // TODO: Not implemented in the API
                              },
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
                              validator: (text) {
                                if (text.isEmpty) {
                                  return 'برجاء إدخال البيانات المطلوبة';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (text) {
                                employeeForm['address'] = text;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'هدف العميل',
                                labelText: 'هدف العميل',
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                              validator: (text) {
                                if (text.isEmpty) {
                                  return 'برجاء إدخال البيانات المطلوبة';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (text) {
                                employeeForm['target'] = text;
                              },
                            ),
                            kverticalSpace16,
                            DropdownButton<String>(
                              value: _selectedPlace,
                              hint: Text('المنطقة'),
                              isExpanded: true,
                              itemHeight: 64,
                              items: employeesData.employeeAreas.map((area) {
                                return DropdownMenuItem(
                                  value: area.id,
                                  child: Text(area.name),
                                );
                              }).toList(),
                              onChanged: (String i) {
                                setState(() {
                                  _selectedPlace = i;
                                });
                                employeeForm['area'] = i;
                              },
                            ),
                            kverticalSpace16,
                            DropdownButton<int>(
                              value: _selectedCategory,
                              hint: Text('التصنيف'),
                              isExpanded: true,
                              itemHeight: 64,
                              items:
                                  employeesData.employeeCategories.map((area) {
                                return DropdownMenuItem(
                                  value: area.id,
                                  child: Text(area.name),
                                );
                              }).toList(),
                              onChanged: (int i) {
                                setState(() {
                                  _selectedCategory = i;
                                });
                                employeeForm['category'] = i;
                              },
                            ),
                            kverticalSpace32,
                            FullWidthButton(
                              btnText: 'حفظ البيانات',
                              btnColor: mainColor,
                              btnTextColor: Colors.white,
                              btnIcon: Icons.save_outlined,
                              onBtnPressed:
                                  _isSending ? null : saveEmployeeForm,
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
