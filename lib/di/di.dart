import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/pref/shared_pref.dart';
import '../repo/auth/impl/pin_code_repo_impl.dart';
import '../repo/auth/pin_code_repo.dart';

final di = GetIt.instance;

Future<void> setUp() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  di.registerSingleton(sharedPreferences);
  di.registerSingleton(PreferenceHelper(di.get()));
  //di.registerSingletonAsync<AppLocalDatabase>(() => $FloorAppLocalDatabase.databaseBuilder('app_database.db').build());
  di.registerSingleton<PasswordRepo>(PasswordRepoImpl(di.get<PreferenceHelper>()));
  // di.registerFactory<PasswordRepoImpl>(() => PasswordRepoImpl(di.get()));
  // di.registerSingleton(PasswordRepoImpl(di.get()));
 // di.registerSingleton<UserScreenRepo>(UserScreenRepo(db: Get.find()));
}
