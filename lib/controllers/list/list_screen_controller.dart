import 'package:debt_controller/db/local/client/client_entity.dart';
import 'package:debt_controller/ui/screens/clinet_debts/client_debt_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repo/list/list_screen_repo.dart';

class ListScreenController extends GetxController {
  ListScreenRepo listScreenRepo;

  final _users=<ClientData>[].obs;

  List<ClientData> get users => _users.value;

  ListScreenController(this.listScreenRepo);

  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }

  void getAllUsers() async {
    listScreenRepo.getAllUsers()?.listen((user) => _users.value=user);
  }

  void openClintDebitScreen(BuildContext context,int id){
    Navigator.pushNamed(context, ClientDebtScreen.route,arguments: {
      "id":id
    });
  }

}
