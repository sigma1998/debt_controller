import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:debt_controller/repo/clint_add_debit/add_client_debit_repo.dart';
import '../../../db/local/local_database.dart';

class AddClientRepoImpl extends AddClientDebitRepo{
  AppLocalDatabase? db;

  AddClientRepoImpl({required this.db});

  @override
  void addDebit(DebtModel debtModel) {
    db?.debtDao.insertDebit(debtModel);
  }

}