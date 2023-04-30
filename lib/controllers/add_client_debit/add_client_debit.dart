import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../db/local/debt/debt_entity.dart';
import '../../models/debt_model.dart';
import '../../repo/clint_add_debit/impl/add_clint_repo_impl.dart';

class AddClientDebitController extends GetxController{
  final _nameController=TextEditingController().obs;
  final _colorController=TextEditingController().obs;
  final _jamiSummaController=TextEditingController().obs;
  final _boshlangichSummaController=TextEditingController().obs;
  final _boshlagichSanaController=TextEditingController().obs;
  final _tugashSanaController=TextEditingController().obs;
  final _qushimchaController=TextEditingController().obs;
   int id=0;

  var nameErrorMessage="".obs;
  var addressErrorMessage="".obs;
  var phoneErrorMessage="".obs;

  AddClientRepoImpl repository;


  AddClientDebitController(this.repository);

  TextEditingController get nameController =>_nameController.value;
  TextEditingController get colorController => _colorController.value;
  TextEditingController get jamiSummaController => _jamiSummaController.value;
  TextEditingController get boshlangichSummaController => _boshlangichSummaController.value;
  TextEditingController get boshlagichSanaController => _boshlagichSanaController.value;
  TextEditingController get tugashSanaController => _tugashSanaController.value;
  TextEditingController get qushimchaController => _qushimchaController.value;

  void addDebitClint(){
    int givenMoney=int.parse(boshlangichSummaController.text);
    int totalMoney=int.parse(jamiSummaController.text);
    String itemName=nameController.text;
    repository.addDebit(EachDebtModel.fromEntity(DebtModel(clientId: id, itemName: itemName, itemColor: colorController.text, description: qushimchaController.text, startingWhole: boshlagichSanaController.text, endingWhole: tugashSanaController.text, givenMoney: givenMoney, totalMoney: totalMoney)).toEntity());
  }

}