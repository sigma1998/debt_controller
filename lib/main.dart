import 'package:debt_controller/ui/screens/clinet_debts/client_debt_screen.dart';
import 'package:debt_controller/ui/screens/home/home_screen.dart';
import 'package:debt_controller/ui/screens/monthly_screen/monthly_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      title: 'Debt Controller',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: const ClientDebtScreen(),
    );
  }
}
