import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class DebtDao {
  @Query('select * from debt where clientId =:id')
  Future<List<DebtModel>> getAll(int id);
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