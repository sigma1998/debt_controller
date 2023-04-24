import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:debt_controller/models/date.dart';
import 'package:debt_controller/models/item_data.dart';
import 'package:debt_controller/models/monthly_payment.dart';

class EachDebtModel {
  int? id;
  int? clientId;
  ItemData? itemData;
  Date? startingTime;
  Date? endingTime;
  int? givenMoney;
  int? totalMoney;
  bool isActive = true;
  List<MonthlyPayment>? monthlyPayment;

  EachDebtModel.fromEntity(DebtModel model) {
    id = model.id;
    clientId = model.clientId;

    itemData?.name = model.itemName;
    itemData?.color = model.itemColor;
    itemData?.description = model.description;
    itemData?.images = ItemData.toList(model.itemImages);

    startingTime?.whole = model.startingWhole;
    startingTime?.year = model.startingYear;
    startingTime?.month = model.startingMonth;
    startingTime?.day = model.startingDay;

    endingTime?.whole = model.endingWhole;
    endingTime?.year = model.endingYear;
    endingTime?.month = model.endingMonth;
    endingTime?.day = model.endingDay;

    givenMoney = model.givenMoney;
    totalMoney = model.totalMoney;

    isActive = model.isActive;

    var list  = model.monthlyPayment?.split('#');
    list?.forEach((element) {
      monthlyPayment?.add(MonthlyPayment.fromEntity(element));
    });
  }

  DebtModel toEntity() {
    DebtModel model = DebtModel();
    model.id = id;
    model.clientId = clientId;

    model.itemName = itemData?.name;
    model.itemColor = itemData?.color;
    model.description = itemData?.description;
    model.itemImages = ItemData.toEntity(itemData?.images);

    model.startingWhole = startingTime?.whole;
    model.startingDay = startingTime?.day;
    model.startingMonth = startingTime?.month;
    model.startingYear = startingTime?.year;

    model.endingWhole = endingTime?.whole;
    model.endingDay = endingTime?.day;
    model.endingMonth = endingTime?.month;
    model.endingYear = endingTime?.year;

    model.givenMoney = givenMoney;
    model.totalMoney = totalMoney;
    model.isActive = isActive;

    StringBuffer sb = StringBuffer();
    monthlyPayment?.forEach((element) {
      sb.write(sb.isEmpty ? element.toEntity() : '#${element.toEntity()}');
    });
    model.monthlyPayment = sb.toString();
    return model;
  }
}