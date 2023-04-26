import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../di/di.dart';
import '../../repo/auth/impl/pin_code_repo_impl.dart';

class PinCodeController extends GetxController{
  final PasswordRepoImpl passwordRepoImpl=PasswordRepoImpl(di.get());

  //PinCodeController(this.passwordRepoImpl);

  Future<void> saveCode(String code) async{
    passwordRepoImpl.saveCode(code);
  }

  Future<String> getCode()async{
    return passwordRepoImpl.getCode();
  }

  Future<void> setLastScreen(bool isLast)async{
    passwordRepoImpl.setLastScreen(isLast);
  }

  bool getLastScreen(){
    return passwordRepoImpl.getLastScreen();
  }

}