import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:debt_controller/models/item_data.dart';
import 'package:debt_controller/models/monthly_payment.dart';

class EachDebtModel {
  int? id;
  int? clientId;
  ItemData? itemData;
  String? itemName;
  String? color;
  String? description;
  List<String>? images;
  // Date? startingTime;
  // Date? endingTime;

  int? startDay;
  int? startMonth;
  int? startYear;
  String? startWhole;

  int? endDay;
  int? endMonth;
  int? endYear;
  String? endWhole;

  int? givenMoney;
  int? totalMoney;
  bool isActive = true;
  List<MonthlyPayment>? monthlyPayment;

  EachDebtModel.fromEntity(DebtModel model) {
    id = model.id;
    clientId = model.clientId;

    // itemData?.itemName = model.itemName;
    // itemData?.color = model.itemColor;
    // itemData?.description = model.description;
    // itemData?.images = ItemData.toList(model.itemImages);

    itemName = model.itemName;
    color = model.itemColor;
    description = model.description;
    images = ItemData.toList(model.itemImages);

    // startingTime?.whole = model.startingWhole;
    // startingTime?.year = model.startingYear;
    // startingTime?.month = model.startingMonth;
    // startingTime?.day = model.startingDay;

    // Date.fromEntity("${model.startingWhole}${model.startingYear}${model.startingMonth}${model.startingDay}").toEntity();
    // Date.fromEntity("${model.endingWhole}${model.endingYear}${model.endingMonth}${model.endingDay}").toEntity();

    // endingTime?.whole = model.endingWhole;
    // endingTime?.year = model.endingYear;
    // endingTime?.month = model.endingMonth;
    // endingTime?.day = model.endingDay;

    startWhole=model.startingWhole;
    startYear=model.startingYear;
    startMonth=model.startingMonth;
    startDay=model.startingDay;

    endWhole=model.endingWhole;
    endYear=model.endingYear;
    endMonth=model.endingMonth;
    endDay=model.endingDay;

    givenMoney = model.givenMoney;
    totalMoney = model.totalMoney;

    isActive = model.isActive;

    var list  = model.monthlyPayment?.split('#');
    list?.forEach((element) {
      monthlyPayment?.add(MonthlyPayment.fromEntity(element));
    });
  }

  DebtModel toEntity() {
    DebtModel model = DebtModel(clientId: clientId, itemName: itemName, itemColor: color, description: description, startingWhole: startWhole, endingWhole: endWhole, givenMoney: givenMoney, totalMoney: totalMoney);
    model.id = id;
    model.clientId = clientId;

    // model.itemName = itemData?.itemName;
    // model.itemColor = itemData?.color;
    // model.description = itemData?.description;
    // model.itemImages = ItemData.toEntity(itemData?.images);

    model.itemName = itemName;
    model.itemColor = color;
    model.description = description;
    model.itemImages = ItemData.toEntity(itemData?.images);

    // model.startingWhole = startingTime?.whole;
    // model.startingDay = startingTime?.day;
    // model.startingMonth = startingTime?.month;
    // model.startingYear = startingTime?.year;
    //
    // model.endingWhole = endingTime?.whole;
    // model.endingDay = endingTime?.day;
    // model.endingMonth = endingTime?.month;
    // model.endingYear = endingTime?.year;

    model.startingWhole = startWhole;
    model.startingDay = startDay;
    model.startingMonth = startMonth;
    model.startingYear = startYear;

    model.endingWhole = endWhole;
    model.endingDay = endDay;
    model.endingMonth = endMonth;
    model.endingYear = endYear;

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