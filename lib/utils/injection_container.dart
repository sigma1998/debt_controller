import 'package:debt_controller/db/local/local_database.dart';
import 'package:debt_controller/repo/user_screen/user_screen_repo.dart';
import 'package:get/get.dart';


import '../repo/list/list_screen_repo.dart';


import '../repo/list/list_screen_repo.dart';

import '../controllers/add_user/add_user_controller.dart';


Future<void> init() async {
  final db = await $FloorAppLocalDatabase
      .databaseBuilder('app_local_data_base.db')
      .build();

  ///data base
  Get.lazyPut<AppLocalDatabase>(() => db, fenix: true);

  ///repo

  Get.lazyPut<UserScreenRepo>(() => UserScreenRepo(db: db), fenix: true);

  Get.lazyPut<ListScreenRepo>(() => ListScreenRepo(db: db), fenix: true);

  ///controllers
  Get.lazyPut<AddUserController>(() => AddUserController(),
      fenix: true);

}
