import 'package:elwataneya_sales_app/screens/employees_screens/bill_preview_screen.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class EmployeeBillScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/employeeBillScreen';
  @override
  _EmployeeBillScreenState createState() => _EmployeeBillScreenState();
}

class _EmployeeBillScreenState extends State<EmployeeBillScreen> {
  List<bool> _billTypeValues = [true, false];
  List<bool> testList = [true, false, false, false, false, false];

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 2),
        lastDate: DateTime(DateTime.now().year + 1));
    if (picked != null && picked != selectedDate) {
      // User picked a Date
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إضافة فاتورة جديدة',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: redColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: _selectDate,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Card(
                        elevation: kcardElevation,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      '2021/01/28',
                                      style: ksubtitleTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'مصطفى يوسف',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'حلوان',
                                    style: TextStyle(
                                      color: redColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              ToggleButtons(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('فاتورة'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('مرتجع'),
                                  ),
                                ],
                                isSelected: _billTypeValues,
                                onPressed: (i) {
                                  setState(() {
                                    print('$i pressed');
                                    for (int j = 0;
                                        j < _billTypeValues.length;
                                        j++) {
                                      if (j == i) {
                                        _billTypeValues[j] = true;
                                      } else {
                                        _billTypeValues[j] = false;
                                      }
                                    }
                                  });
                                },
                                constraints: BoxConstraints.expand(
                                  width: MediaQuery.of(context).size.width / 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: ExpansionPanelList(
                        elevation: 4,
                        expansionCallback: (i, isExpanded) {
                          setState(() {
                            testList[i] = !isExpanded;
                          });
                        },
                        children: [
                          ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  'شيبسى',
                                  style: ktitleTextStyle,
                                ),
                                subtitle: Text('جامبو 8 جنيه'),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'الكمية',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(fontSize: 16),
                                          decoration: InputDecoration(
                                            hintText: 'الكمية',
                                          ),
                                          keyboardType: TextInputType.number,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: testList[i],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            FullWidthButton(
              btnText:
                  _billTypeValues[0] ? 'معاينة الفاتورة' : 'معاينة المرتجع',
              btnColor: mainColor,
              btnTextColor: Colors.white,
              btnIcon: Icons.list_alt_outlined,
              onBtnPressed: () {
                Navigator.of(context).pushNamed(BillPreviewScreen.ROUTE_NAME);
              },
            ),
          ],
        ),
      ),
    );
  }
}
