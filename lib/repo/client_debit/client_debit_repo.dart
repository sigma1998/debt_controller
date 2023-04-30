import '../../db/local/debt/debt_entity.dart';

abstract class ClientDebitRepo{
  Stream<List<DebtModel>>? getDebit(int id);
}