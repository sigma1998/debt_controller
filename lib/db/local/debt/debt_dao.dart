import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class DebtDao {
  @Query('select * from debt where clientId =:id')
  Stream<List<DebtModel>> getAll(int id);


  @Insert()
  Future<void> insertDebit(DebtModel model);

  @Update()
  Future<void> updateDebit(DebtModel model);

  @Query('delete * from debt where id =:id')
  Future<void> deleteDebit(int id);

  // @Query('SELECT * FROM client WHERE id = :id')
  // Future<ClientModel?> getUser(int id);
}

//
// @Insert()
// Future<void> insertDebt(DebtModel model);
//
// @Update()
// Future<void> updateDebt(DebtModel model);
// //
// // @Query('delete * from debt where id =:id')
// // void deleteDebt(int id);