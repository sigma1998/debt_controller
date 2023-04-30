import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../controllers/add_client_debit/add_client_debit.dart';
import '../../../values/app_colors.dart';

class AddClientDebitScreen extends StatelessWidget {
  static const route = "add_client_debit_screen";

  AddClientDebitScreen({Key? key}) : super(key: key);

  String phoneErrorMessage = "";
  String nameErrorMessage = "";
  String addressErrorMessage = "";
  int id=0;

  final controller = Get.find<AddClientDebitController>();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.boshlagichSanaController.text = picked.toString();
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.tugashSanaController.text=picked.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, int?>?;

    if(args!=null){
      id = args["clientId"]!;
    }

    return Scaffold(
      appBar: getAppBar(context),
      body: Builder(builder: (context) {
        controller.id=id;
        print("Idddddd ================= $id");
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Obx(() => getTextFields(controller.nameController,
                    'Mahsulot nomi', TextInputType.text)),
                Obx(() => getTextFields(controller.colorController,
                    'Mahsulot rangi', TextInputType.text)),
                Obx(() => getTextFields(controller.jamiSummaController,
                    'Jami summa', TextInputType.phone)),
                Obx(() => getTextFields(controller.boshlangichSummaController,
                    'Boshlangich summa', TextInputType.number)),
                Obx(() => getStartDataTextFields(context,controller.boshlagichSanaController,
                    'Boshlangich sanasi', TextInputType.datetime)),
                Obx(() => getEndEndTextFields(context,controller.tugashSanaController,
                    'Tugash sanasi', TextInputType.datetime)),
                Obx(() => getTextFields(controller.qushimchaController,
                    'qushimcha malumot', TextInputType.phone)),
                const SizedBox(
                  height: 10,
                ),
                getSaveBtn(context),
              ],
            ),
          ),
        );
      }),
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
              'Maxsulot qushish',
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

  getTextFields(TextEditingController controller, String hint,
      TextInputType textInputType) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 26, right: 16),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            keyboardType: textInputType,
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

  getStartDataTextFields(BuildContext context,TextEditingController controller, String hint,
      TextInputType textInputType) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 26, right: 16),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: controller,
            onTap: () => _selectStartDate(context),
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

  getEndEndTextFields(BuildContext context,TextEditingController controller, String hint,
      TextInputType textInputType) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 26, right: 16),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: controller,
            onTap: () => _selectEndDate(context),
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

  getSaveBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          controller.addDebitClint();
        },
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
      ),
    );
  }
}
