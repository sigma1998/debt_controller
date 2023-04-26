import 'package:debt_controller/ui/screens/auth/pin_code_replase_screen.dart';
import 'package:debt_controller/ui/screens/auth/widgets/app_keyboard.dart';
import 'package:debt_controller/ui/screens/auth/widgets/dot_indecator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/auth/pin_code_controller.dart';

class PinCodeScreen extends StatefulWidget {
  static const String route = "pin_code";
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final PinCodeController myController = Get.put(PinCodeController());
  String _pinCode = "";
  late final Function(String element) onTap;

  @override
  void initState() {
    super.initState();
  }

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
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DotIndicator(state:_pinCode.isNotEmpty),
              DotIndicator(state:_pinCode.length >= 2),
              DotIndicator(state:_pinCode.length >= 3),
              DotIndicator(state:_pinCode.length >= 4),
            ],
          ),
          // GestureDetector(
          //   onTap: () {
          //     print("click  PIN qayta o'rnatish");
          //   },
          //   child: const Center(
          //     child: Text(
          //       "PIN qayta o'rnatish",
          //       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16, decoration: TextDecoration.underline),
          //     ),
          //   ),
          // ),
          AppKeyboard(stringValue: (value) {
            setState(() {});
            if (value.length == 4) {
              myController.saveCode(value);
              Navigator.pushNamedAndRemoveUntil(context, PinCodeReplace.route,(Route<dynamic> route) => false);
            }
            return _pinCode = value;
          })
        ],
      ),
    );
  }
}