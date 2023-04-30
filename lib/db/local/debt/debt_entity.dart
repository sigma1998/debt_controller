import 'package:floor/floor.dart';

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

  DebtModel(
      {required this.clientId,
      required this.itemName,
      required this.itemColor,
      required this.description,
      required this.startingWhole,
      required this.endingWhole,
      required this.givenMoney,
      required this.totalMoney});
}
