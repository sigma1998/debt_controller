import 'package:debt_controller/ui/screens/add_client_debit/add_client_debit_screen.dart';
import 'package:debt_controller/ui/screens/auth/pin_code_replase_screen.dart';
import 'package:debt_controller/ui/screens/auth/pin_code_screen.dart';
import 'package:debt_controller/ui/screens/clinet_debts/client_debt_screen.dart';
import 'package:debt_controller/ui/screens/home/home_screen.dart';
import 'package:debt_controller/utils/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'di/di.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await setUp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // PreferenceHelper preferenceHelper=PreferenceHelper(di.get());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      title: 'Debt Controller',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),

      home: const HomeScreen(),

      routes: {
        PinCodeScreen.route:(context)=> const PinCodeScreen(),
        PinCodeReplace.route:(context)=> const PinCodeReplace(),
        HomeScreen.route:(context)=> const HomeScreen(),
        AddClientDebitScreen.route:(context)=> AddClientDebitScreen(),
        ClientDebtScreen.route:(context)=> ClientDebtScreen(),
      },
    );
  }
}
