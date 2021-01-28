import 'package:elwataneya_sales_app/screens/finances_screens/car_order_print_view_screen.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class NewCarOrderScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/newCarOrderScreen';
  @override
  _NewCarOrderScreenState createState() => _NewCarOrderScreenState();
}

class _NewCarOrderScreenState extends State<NewCarOrderScreen> {
  List<bool> testList = [true, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إضافة طلب تحميل',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: ExpansionPanelList(
                      expansionCallback: (i, isExpanded) {
                        setState(() {
                          testList[i] = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          canTapOnHeader: true,
                          headerBuilder: (context, isExpanded) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  'شيبسى',
                                  style: ktitleTextStyle,
                                ),
                                subtitle: Text('جامبو 8 جنيه'),
                              ),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
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
                                          decoration: InputDecoration(
                                            hintText: 'الكمية',
                                            enabledBorder:
                                                ktextFieldEnabledBorder,
                                            focusedBorder:
                                                ktextFieldFocusedBorder,
                                          ),
                                          keyboardType: TextInputType.number,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, i) {
                                return Divider();
                              },
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
            FullWidthButton(
              btnText: 'معاينة الطلب',
              btnColor: mainColor,
              btnTextColor: Colors.white,
              btnIcon: Icons.done_outline,
              onBtnPressed: () {
                Navigator.of(context)
                    .pushNamed(CarOrderPrintViewScreen.ROUTE_NAME);
              },
            ),
          ],
        ),
      ),
    );
  }
}
