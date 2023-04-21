import 'package:debt_controller/ui/screens/widget/debt_item.dart';
import 'package:debt_controller/ui/screens/widget/monthly_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../values/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      appBar: getAppBar(context),
      body: Column(children: const [DebtItem()],),
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
              'Eslatmalar',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.black),
            ),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // controller.onSearchPressed();
          },
          child: const SizedBox(
            width: 24,
            child: Icon(
              Icons.search,
              color: Colors.black87,
            ),
          ),
        ),
        getHorSizedBox(16),
        GestureDetector(
          onTap: () {
            // controller.onSearchPressed();
          },
          child: const SizedBox(
            width: 24,
            child: Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
        ),
        getHorSizedBox(26),
      ],
    );
  }

  getSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4),
      child: Container(
        //  width: controller.typing ? double.infinity : 0,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            color: AppColors.grey),
        child: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: TextField(
            // controller: controller.searchController,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            autofocus: true,
          ),
        ),
      ),
    );
  }

  getHorSizedBox(double width) {
    return SizedBox(
      width: width,
    );
  }

}