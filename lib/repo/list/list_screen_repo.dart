import 'package:debt_controller/db/local/client/client_entity.dart';
import '../../db/local/local_database.dart';


class ListScreenRepo{
  AppLocalDatabase? db;

  ListScreenRepo({required this.db});

  Stream<List<ClientData>>? getAllUsers(){
    return db?.clientDao.getAll();
  }
}