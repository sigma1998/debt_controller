import 'package:get/get.dart';

import '../../models/client_model.dart';
import '../../repo/user_screen/user_screen_repo.dart';

class UserScreenController extends GetxController{
  UserScreenRepo userScreenRepo;

  UserScreenController(this.userScreenRepo);
  bool isLoading=false;

  void addUser(ClientModel clientModel){
    userScreenRepo.addUSer(clientModel);
  }

}