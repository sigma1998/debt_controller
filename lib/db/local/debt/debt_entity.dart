import 'package:debt_controller/models/item_data.dart';
import 'package:floor/floor.dart';
import '../client/client_entity.dart';
import '../../../models/date.dart';
import '../../../models/monthly_payment.dart';

@Entity(tableName: 'debt')
class DebtModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? clientId;
  String? itemName;
  String? itemColor;
  String? description;
  String? itemImages;
  int? startingDay;
  int? startingMonth;
  int? startingYear;
  String? startingWhole;
  int? endingDay;
  int? endingMonth;
  int? endingYear;
  String? endingWhole;
  int? givenMoney;
  int? totalMoney;
  bool isActive = true;
  String? monthlyPayment;
}
