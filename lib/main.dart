import 'package:elwataneya_sales_app/providers/auth.dart';
import 'package:elwataneya_sales_app/providers/debts.dart';
import 'package:elwataneya_sales_app/providers/employees.dart';
import 'package:elwataneya_sales_app/providers/user_profile.dart';
import 'package:elwataneya_sales_app/screens/employees_screens/bill_preview_screen.dart';
import 'package:elwataneya_sales_app/screens/employees_screens/employee_bill_Screen.dart';
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
import 'package:elwataneya_sales_app/screens/main_layouts/google_maps_screen.dart';
import 'package:elwataneya_sales_app/screens/main_layouts/login_screen.dart';
import 'package:elwataneya_sales_app/screens/main_layouts/main_layout_screen.dart';
import 'package:elwataneya_sales_app/screens/main_layouts/splash_screen.dart';
import 'package:elwataneya_sales_app/screens/more_screens/offers_screen.dart';
import 'package:elwataneya_sales_app/screens/more_screens/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(WataneyaApp());
}

class WataneyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, UserProfile>(
          update: (context, authData, prevUserProfile) =>
              UserProfile(authData.uid),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Debts>(
          update: (context, authData, prevDebts) => Debts(authData.uid),
          create: null,
        ),
        ChangeNotifierProxyProvider<Auth, Employees>(
          update: (context, authData, prevEmployees) => Employees(authData.uid),
          create: null,
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, authData, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'El-Watanya Sales',
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
          theme: ThemeData.dark(),
          home: authData.isAuth()
              ? MainLayoutScreen()
              : FutureBuilder(
                  future: authData.tryLogin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SplashScreen();
                    } else {
                      return LoginScreen();
                    }
                  },
                ),
          routes: {
            MainLayoutScreen.ROUTE_NAME: (context) => MainLayoutScreen(),
            NewEmployeeScreen.ROUTE_NAME: (context) => NewEmployeeScreen(),
            RouteEmployeesScreen.ROUTE_NAME: (context) =>
                RouteEmployeesScreen(),
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
            EmployeeBillScreen.ROUTE_NAME: (context) => EmployeeBillScreen(),
            BillPreviewScreen.ROUTE_NAME: (context) => BillPreviewScreen(),
            LoginScreen.ROUTE_NAME: (context) => LoginScreen(),
            GoogleMapsScreen.ROUTE_NAME: (context) => GoogleMapsScreen(),
          },
        ),
      ),
    );
  }
}
