import 'package:debt_controller/models/item_data.dart';
import 'client_data.dart';
import 'date.dart';
import 'monthly_payment.dart';

class DebtModel {
  ClientData? user;
  ItemData? itemData;
  Date? startingDate;
  Date? finishingDate;
  int? givenMoney;
  int? totalMoney;
  bool isActive = true;
  List<MonthlyPayment>? monthlyPayment;

  DebtModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    itemData = json['itemData'];
    startingDate = json['startingDate'];
    finishingDate = json['finishingDate'];
    givenMoney = json['givenMoney'];
    totalMoney = json['totalMoney'];
    isActive = json['isActive'];
    if (json['monthlyPayment'] != null) {
      monthlyPayment = <MonthlyPayment>[];
      json['images'].forEach((v) {
        monthlyPayment!.add(MonthlyPayment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = user?.toJson();
    data['itemData'] = itemData?.toJson();
    data['startingDate'] = startingDate?.toJson();
    data['finishingDate'] = finishingDate?.toJson();
    data['givenMoney'] = givenMoney;
    data['totalMoney'] = totalMoney;
    data['isActive'] = isActive;
    if (monthlyPayment != null) {
      data['monthlyPayment'] = monthlyPayment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
