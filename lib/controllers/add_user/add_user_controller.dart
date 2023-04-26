import 'package:debt_controller/db/local/client/client_entity.dart';
import 'package:debt_controller/utils/app_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String imageId = 'user_image_id';
  String id = 'user_screen_id';
  AppStates state = AppStates.initial;

  ClientData client = ClientData();

  void setImage(String path) {
    client.images = path;
    update([imageId]);
  }

  updateUI(AppStates states) {
    state = states;
    update();
  }

}