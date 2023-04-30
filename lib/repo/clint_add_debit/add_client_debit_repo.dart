import '../../db/local/debt/debt_entity.dart';

abstract class AddClientDebitRepo{
  void addDebit(DebtModel debtModel);
}