import 'package:debt_controller/db/local/local_database.dart';
import 'package:debt_controller/repo/user_screen/user_screen_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  final db = await $FloorAppLocalDatabase
      .databaseBuilder('app_local_data_base.db')
      .build();

  ///data base
  Get.lazyPut<AppLocalDatabase>(() => db, fenix: true);

  ///repo
  Get.lazyPut<UserScreenRepo>(() => UserScreenRepo(db: Get.find()),
      fenix: true);
}
