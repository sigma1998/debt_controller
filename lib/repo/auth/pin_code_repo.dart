abstract class PasswordRepo{

  Future<void> saveCode(String code);
  Future<String> getCode();
  Future<void> setLastScreen(bool isLast);
  bool getLastScreen();

}