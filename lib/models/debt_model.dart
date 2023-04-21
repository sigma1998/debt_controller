
import 'package:debt_controller/models/item_data.dart';

import 'client_data.dart';
import 'date.dart';
import 'monthly_payment.dart';

class DebtModel {
  ClientData? user;
  ItemData? itemData;
  Date? startingDate;
  Date? finishingDate;
  Date? lastPayment;
  int? givenMoney;
  int? totalMoney;
  List<MonthlyPayment>? monthlyPayment;
  bool isActive = true;
}