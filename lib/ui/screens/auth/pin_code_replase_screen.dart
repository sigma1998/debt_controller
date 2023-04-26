import 'package:debt_controller/ui/screens/auth/widgets/app_keyboard.dart';
import 'package:debt_controller/ui/screens/auth/widgets/dot_indecator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/auth/pin_code_controller.dart';
import '../home/home_screen.dart';

class PinCodeReplace extends StatefulWidget {
  static const route = "pin_code_replace";

  const PinCodeReplace({Key? key}) : super(key: key);

  @override
  State<PinCodeReplace> createState() => _PinCodeReplaceState();
}

class _PinCodeReplaceState extends State<PinCodeReplace> {
  final PinCodeController myController = Get.put(PinCodeController());
  String _pinCode = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "PIN kiriting",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotIndicator(state: _pinCode.isNotEmpty),
                DotIndicator(state: _pinCode.length >= 2),
                DotIndicator(state: _pinCode.length >= 3),
                DotIndicator(state: _pinCode.length >= 4),
              ],
            ),
            GestureDetector(
              onTap: () {
                print("click  PIN qayta o'rnatish");
                print(myController.getLastScreen());
              },
              child:  Center(
                child: Text( myController.getLastScreen()?
                "PIN codni qayta kiriting":"PIN codni qayta kiriting",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            AppKeyboard(stringValue: (value) async {
              setState(() {});
              String myCode = await myController.getCode();
              if (value.length == 4 && value == myCode) {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.route, (Route<dynamic> route) => false);
                myController.setLastScreen(true);
              } else if (value.length == 4 && value != myCode) {
                setState(() {
                  _pinCode="";
                });
                Fluttertoast.showToast(
                  msg: 'parol xato!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[800],
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
              return _pinCode = value;
            })
          ],
        ),
    );
  }
}