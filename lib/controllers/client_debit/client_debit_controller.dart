import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../repo/client_debit/impl/client_debit_repo_impl.dart';
import '../../ui/screens/add_client_debit/add_client_debit_screen.dart';
class ClientDebitController extends GetxController{

  ClientDebitRepoImpl repository;
  final _allDebits=<DebtModel>[].obs;

  List<DebtModel> get allDebits => _allDebits.value;

  ClientDebitController(this.repository){
    update();
  }

  void openAddClintDebitScreen(BuildContext context){
    Navigator.pushNamed(context, AddClientDebitScreen.route);
  }

  Stream<List<DebtModel>>? getAllDbts(int id) {
    return repository.getDebit(id);
  }

  // Future<ClientModel?>? getUser(int id){
  //   return repository.getClient(id);
  // }

}

