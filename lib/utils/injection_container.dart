import 'package:debt_controller/controllers/add_client_debit/add_client_debit.dart';
import 'package:debt_controller/controllers/client_debit/client_debit_controller.dart';
import 'package:debt_controller/db/local/local_database.dart';
import 'package:debt_controller/repo/user_screen/user_screen_repo.dart';
import 'package:get/get.dart';

import '../controllers/add_user/add_user.dart';
import '../repo/client_debit/impl/client_debit_repo_impl.dart';
import '../repo/clint_add_debit/impl/add_clint_repo_impl.dart';
import '../repo/list/list_screen_repo.dart';

Future<void> init() async {
  final db = await $FloorAppLocalDatabase
      .databaseBuilder('app_local_data_base.db')
      .build();

  ///data base
  Get.lazyPut<AppLocalDatabase>(() => db, fenix: true);

  ///repo

  Get.lazyPut<UserScreenRepo>(() => UserScreenRepo(db: db), fenix: true);

  Get.lazyPut<ListScreenRepo>(() => ListScreenRepo(db: db), fenix: true);

  Get.lazyPut<ClientDebitRepoImpl>(() => ClientDebitRepoImpl(db: db), fenix: true);

  Get.lazyPut<AddClientRepoImpl>(() => AddClientRepoImpl(db: db), fenix: true);



  ///controllers
  Get.lazyPut<AddUserController>(() => AddUserController(Get.find()),
      fenix: true);

  Get.lazyPut<ClientDebitController>(() => ClientDebitController(Get.find()),
      fenix: true);

  Get.lazyPut<AddClientDebitController>(() => AddClientDebitController(Get.find()),
      fenix: true);
}
