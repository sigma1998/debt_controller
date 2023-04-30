import 'package:debt_controller/ui/screens/widget/debt_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/client_debit/client_debit_controller.dart';
import '../../../db/local/debt/debt_entity.dart';
import '../../../values/app_colors.dart';
import '../add_client_debit/add_client_debit_screen.dart';

class ClientDebtScreen extends StatelessWidget {
  static const route = "client_debt_screen";

  ClientDebtScreen({super.key});


  final controller = Get.find<ClientDebitController>();

  List<DebtModel> debitModel=[];

  @override
  Widget build(BuildContext context) {

    final args=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;

    int?  id=args["id"];
    String? name=args["name"];
    String phone=args["phone"];

    return Scaffold(
        backgroundColor: AppColors.lightOrange,
        appBar: getAppBar(context,id!),
        body: StreamBuilder<List<DebtModel>>(
          stream: controller.getAllDbts(id),
          builder: (context, snapshot){
            final List<DebtModel> debts = snapshot.data??[];
            return ListView.builder(
                itemCount: debts.length,
                itemBuilder: (BuildContext context, int index) {
                  print("ID======================================================$id");
                  print("BMW =============== ====== ====== ${debts[index].itemName.toString()}");
                  return DebtItem(
                    mijoz: name!,
                    telifonRaqami: phone,
                    nomi: debts[index].itemName.toString(),
                    rangi: debts[index].itemColor.toString(),
                    jamiSumma: debts[index].givenMoney.toString(),
                    boshlangichSumma: debts[index].totalMoney.toString(),
                    boshlangichSanasi: debts[index].startingWhole.toString(),
                    tugashSanasi: debts[index].endingWhole.toString(),
                    qushimchaMalumot: debts[index].description.toString(),
                  );
                });
          },

        ),
        );
  }



  getAppBar(BuildContext context,int id) {
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
              'Mijozning mahsulotlari',
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
            // Navigator.pushNamed(context, AddClientDebitScreen.route,arguments: {
            //   "clientId":id
            // });

            Navigator.pushNamedAndRemoveUntil(context, AddClientDebitScreen.route,(Route<dynamic> route) => true,arguments: {
              "clientId":id
            });

            //controller.openAddClintDebitScreen(context);
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
