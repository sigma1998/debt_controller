import '../../../db/pref/shared_pref.dart';
import '../pin_code_repo.dart';

class PasswordRepoImpl extends PasswordRepo{
  final PreferenceHelper preferenceHelper;

  PasswordRepoImpl(this.preferenceHelper);

  @override
  Future<String> getCode() async{
    return preferenceHelper.getCode();
  }

  @override
  Future<void> saveCode(String code) async {
    await preferenceHelper.saveCode(code);
  }

  @override
  bool getLastScreen() {
    return preferenceHelper.getLastScreen();
  }

  @override
  Future<void> setLastScreen(bool isLast) async{
    await preferenceHelper.setLastScreen(isLast);
  }

}