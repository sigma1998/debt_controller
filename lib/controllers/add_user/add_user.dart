import 'package:debt_controller/db/local/client/client_entity.dart';
import 'package:debt_controller/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repo/user_screen/user_screen_repo.dart';

class AddUserController extends GetxController {

  final _nameController=TextEditingController().obs;
  final _addressController=TextEditingController().obs;
  final _phoneController=TextEditingController().obs;

  var nameErrorMessage="".obs;
  var addressErrorMessage="".obs;
  var phoneErrorMessage="".obs;

  TextEditingController get nameController =>_nameController.value;
  TextEditingController get addressController => _addressController.value;
  TextEditingController get phoneController => _phoneController.value;
  TextEditingController descriptionController = TextEditingController();

  UserScreenRepo userScreenRepo;

  AddUserController(this.userScreenRepo);


  void addUser() {
    userScreenRepo.addUSer(ClientModel.fromEntity(ClientData(
        fullName: nameController.text,
        address: addressController.text,
        phoneNumber: phoneController.text,
        description: descriptionController.text)));
  }

  bool isFull() {
    if (nameValidator() &&
        addressValidator() &&
        phoneValidator()) {
      //addUser();
      return true;
    }
    return false;
  }

  bool nameValidator() {
    if (nameController.text[0] == nameController.text[0].toUpperCase() &&
        nameController.text.length > 3) {
      return true;
    }
    nameErrorMessage.value="isim notug'ri kiritilgan";
    return false;
  }

  bool addressValidator(){
    if(nameController.text.length>3){
      return true;
    }
    addressErrorMessage.value="address notug'ri kiritilgan";
    return false;
  }

  bool phoneValidator(){
    RegExp regex = RegExp(r'^\+9989[012345789]\d{7}$');
    if(regex.hasMatch(phoneController.text)){
      return true;
    }
    phoneErrorMessage.value="telefon nomer notug'ri kiritilgan";
    return false;
  }
}
