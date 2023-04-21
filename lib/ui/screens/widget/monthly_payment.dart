import 'package:debt_controller/values/app_colors.dart';
import 'package:flutter/material.dart';

class MonthlyPayment extends StatelessWidget {
  const MonthlyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 3,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.lightRed,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                getText('To\'lov sanasi', '01.02.2023'),
                getSaveBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }
  getText(String str, String des) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$str:  ',
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
        Expanded(
          child: Text(
            des,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
  getSaveBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 56,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.blue,
        ),
        child: const Text(
          'O\'zgartitish',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.white),
        ),
      ),
    );
  }

}
