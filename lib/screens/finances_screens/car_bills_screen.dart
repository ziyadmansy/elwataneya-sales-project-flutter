import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class CarBillScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/carBilllsScreen';
  @override
  _CarBillScreenState createState() => _CarBillScreenState();
}

class _CarBillScreenState extends State<CarBillScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'رصيد السيارة',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: kappBarIconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8,
                    ),
                    child: ExpansionPanelList(
                      expansionCallback: (i, isExpanded) {
                        setState(() {
                          this.isExpanded = !isExpanded;
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
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Text(
                                  'الكمية',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'الكمية',
                                    ),
                                    keyboardType: TextInputType.number,
                                    textAlignVertical: TextAlignVertical.center,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isExpanded: isExpanded,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            FullWidthButton(
              btnText: 'طلبات الرصيد',
              btnColor: mainColor,
              btnTextColor: Colors.white,
              btnIcon: Icons.menu,
              onBtnPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
