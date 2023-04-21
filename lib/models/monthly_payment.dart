import 'package:debt_controller/models/date.dart';

class MonthlyPayment {
  bool isActive = true;
  String? description;
  Date? neededDate; ///date that client have to pay on
  Date? doneDate; ///date that client payed on
  List<String>? images;

  MonthlyPayment.fromJson(Map<String, dynamic> json) {
    isActive = json['isActive'];
    description = json['description'];
    neededDate = Date.fromJson(json['neededDate']);
    doneDate = Date.fromJson(json['doneDate']);
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images!.add(v.toString());
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isActive'] = isActive;
    data['description'] = description;
    data['neededDate'] = neededDate;
    data['doneDate'] = doneDate;
    data['images'] = images;
    return data;
  }
}