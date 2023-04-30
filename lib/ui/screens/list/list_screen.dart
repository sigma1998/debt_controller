import 'package:debt_controller/db/local/client/client_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/list/list_screen_controller.dart';
import '../../../values/app_colors.dart';
import '../clinet_debts/client_debt_screen.dart';
import '../widget/user_debt_item.dart';

class ListScreen extends StatefulWidget {
  static const route="list_screen";
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ClientData> users = [];
  final ListScreenController listScreenController =
      Get.put(ListScreenController(Get.find()));

  @override
  void initState() {
    users = listScreenController.users;
    print("initState");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightOrange,
        appBar: getAppBar(context),
        body: Obx(
          () => ListView.builder(
              itemCount: listScreenController.users.length,
              itemBuilder: (BuildContext context, int index) {
                print("List$index=============${listScreenController.users[index].id}");
                return UserDebtItem(
                  fullName:
                      listScreenController.users[index].fullName.toString(),
                  address: listScreenController.users[index].address.toString(),
                  phoneNumber:
                      listScreenController.users[index].phoneNumber.toString(),
                  clickItem: () {
                    Navigator.pushNamed(context, ClientDebtScreen.route,arguments: {
                      "id":listScreenController.users[index].id,
                      "name":listScreenController.users[index].fullName,
                      "phone":listScreenController.users[index].phoneNumber
                    });
                    //listScreenController.openClintDebitScreen(context, listScreenController.users[index].id);
                  },
                );
              }),
        ));
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
              'Barcha mijozlar',
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
