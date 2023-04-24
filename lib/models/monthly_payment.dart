import 'package:debt_controller/models/date.dart';

class MonthlyPayment {
  bool isActive = true;
  String? description;
  Date? neededDate; ///date that client have to pay on
  Date? doneDate; ///date that client payed on
  List<String>? images;

  MonthlyPayment.fromEntity(String element) {
    var list = element.split('*');
    isActive = list[0] == 'true' ? true : false;
    description = list[1];
    neededDate = Date.fromEntity(list[2]);
    doneDate = Date.fromEntity(list[3]);
    images = list[4].split('%');
  }

  String toEntity() {
    StringBuffer model = StringBuffer();
    model.write(isActive);
    model.write('*$description');
    model.write('*${neededDate?.toEntity()}');
    model.write('*${doneDate?.toEntity()}');
    StringBuffer str = StringBuffer();
    images?.forEach((element) {
      str.write(str.isEmpty ? element : '%$element');
    });
    model.write(str.isEmpty.toString());
    return model.isEmpty ? 'null' : model.toString();
  }
}
