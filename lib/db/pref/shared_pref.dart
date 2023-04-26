import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  final SharedPreferences sharedPreferences;

  PreferenceHelper(this.sharedPreferences);

  Future<void> saveCode(String value) async {
    await sharedPreferences.setString("code", value);
  }

  Future<String> getCode() async {
    return sharedPreferences.getString("code") ?? "";
  }

  Future<void> setLastScreen(bool isLast) async {
    await sharedPreferences.setBool("isLast", isLast);
  }

  bool getLastScreen() {
    bool isLast = sharedPreferences.getBool("isLast") ?? false;
    return isLast;
  }
}