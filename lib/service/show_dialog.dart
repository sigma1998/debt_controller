import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

showProgressDialog() {
  Get.dialog(
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: const Center(
        child: CupertinoActivityIndicator(
          radius: 16,
          color: AppColors.white,
        ),
      ),
    ),
  );
}
