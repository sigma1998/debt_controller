import 'package:debt_controller/models/date.dart';

class MonthlyPayment {
  bool isActive = true;
  String? description;
  List<String>? images;
  Date? neededDate; ///date that client have to pay on
  Date? doneDate; ///date that client payed on
}