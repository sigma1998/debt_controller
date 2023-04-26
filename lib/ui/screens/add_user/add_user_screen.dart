import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/add_user/add_user.dart';

import '../../../values/app_colors.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final controller = Get.find<AddUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getPicture(),
            getStar(),
            getTextFields(controller.nameController, 'ism va familiya'),
            getStar(),
            getTextFields(controller.addressController, 'address'),
            getStar(),
            getTextFields(controller.phoneController, 'telefon raqami'),
            const SizedBox(
              height: 10,
            ),
            getText(),
            getDescription(),
            InkWell(
              onTap: () {},
              child: getSaveBtn(),
            )
          ],
        ),
      ),
      appBar: getAppBar(context),
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
              'Yangi mijoz qo\'shish',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  getTextFields(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  getDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: controller.descriptionController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: AppColors.grey,
                ),
                hintText: 'mijoz haqida qo\'shimcha malumot'),
          ),
        ),
      ),
    );
  }

  getSaveBtn() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: AppColors.blue,
            ),
            child: const Text(
              'Saqlash',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.white),
            ),
          ),
        ));
  }

  getPicture() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: 180,
        width: 180,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.white,
        ),
        child: const Icon(
          Icons.person,
          size: 80,
          color: AppColors.grey,
        ),
      ),
    );
  }

  getText() {
    return const Text('~, *, #, % bu belgilardan fondling');
  }

  getStar() {
    return const Text(
      '*',
      style: TextStyle(color: AppColors.red),
    );
  }
}
