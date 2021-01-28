import 'package:elwataneya_sales_app/screens/employees_screens/route_employees.dart';
import 'package:elwataneya_sales_app/screens/employees_screens/new_employee_screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/car_order_print_view_screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/car_orders_screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/debt_details_screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/debts_Screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/bill_details_screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/bills_Screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/car_bills_screen.dart';
import 'package:elwataneya_sales_app/screens/finances_screens/new_car_order.dart';
import 'package:elwataneya_sales_app/screens/main_layouts/main_layout_screen.dart';
import 'package:elwataneya_sales_app/screens/more_screens/offers_screen.dart';
import 'package:elwataneya_sales_app/screens/more_screens/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(WataneyaApp());
}

class WataneyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El-Wataneya Sales',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('ar', ''), // Arabic, no country code
        // ... other locales the app supports
      ],
      locale: const Locale('ar', ''),
      home: MainLayoutScreen(),
      routes: {
        NewEmployeeScreen.ROUTE_NAME: (context) => NewEmployeeScreen(),
        RouteEmployeesScreen.ROUTE_NAME: (context) => RouteEmployeesScreen(),
        OffersScreen.ROUTE_NAME: (context) => OffersScreen(),
        BillsScreen.ROUTE_NAME: (context) => BillsScreen(),
        TasksScreen.ROUTE_NAME: (context) => TasksScreen(),
        CarBillScreen.ROUTE_NAME: (context) => CarBillScreen(),
        DebtsScreen.ROUTE_NAME: (context) => DebtsScreen(),
        BillDetailsScreen.ROUTE_NAME: (context) => BillDetailsScreen(),
        DebtDetailsScreen.ROUTE_NAME: (context) => DebtDetailsScreen(),
        CarOrdersScreen.ROUTE_NAME: (context) => CarOrdersScreen(),
        NewCarOrderScreen.ROUTE_NAME: (context) => NewCarOrderScreen(),
        CarOrderPrintViewScreen.ROUTE_NAME: (context) =>
            CarOrderPrintViewScreen(),
      },
    );
  }
}
