import 'package:debt_controller/db/local/local_database.dart';
import '../../models/client_model.dart';

class UserScreenRepo {
  AppLocalDatabase? db;

  UserScreenRepo({required this.db});

  void addUSer(ClientModel clientModel){
    db?.clientDao.insert(clientModel.toEntity());
  }
}