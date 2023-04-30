import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:debt_controller/repo/client_debit/client_debit_repo.dart';
import '../../../db/local/local_database.dart';


class ClientDebitRepoImpl extends ClientDebitRepo{
  AppLocalDatabase? db;

  ClientDebitRepoImpl({required this.db});

  @override
  Stream<List<DebtModel>>? getDebit(int id) {
    return db?.debtDao.getAll(id);
  }

  // Future<ClientModel?>? getClient(int id){
  //   return db?.debtDao.getUser(id);
  // }


}