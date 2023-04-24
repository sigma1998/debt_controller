import 'package:debt_controller/ui/screens/widget/monthly_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../values/app_colors.dart';
import '../widget/done_monthly_payment.dart';

class MonthlyScreen extends StatelessWidget {
  const MonthlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Column(
        children:  const [
          DoneMonthlyPayment(),
          MonthlyPayment()
        ],
      ),
    );
  }

  getAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: AppColors.white,
      leadingWidth: 55,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      )),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.white),
      title: Row(
        children: const [
          Expanded(
            child: Text(
              'Oylik malumotlar',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
