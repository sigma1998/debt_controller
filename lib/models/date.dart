class Date {
  int? day;
  int? month;
  int? year;
  String? whole; ///string condition that can be parse DataTime

  Date.fromEntity(String date) {
    if(date == 'null') return;
    var list = date.split('~');
    day = int.parse(list[0]);
    month = int.parse(list[1]);
    year = int.parse(list[2]);
    whole = list[3];
  }

  String? toEntity() {
    StringBuffer sb = StringBuffer();
    sb.write(day);
    sb.write('~$month');
    sb.write('~$year');
    sb.write('~$whole');
    return sb.toString();
  }
}
//
// Date.fromJson(Map<String, dynamic> json) {
// day = json['day'];
// month = json['month'];
// year = json['year'];
// whole = json['whole'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['day'] = day;
//   data['month'] = month;
//   data['year'] = year;
//   data['whole'] = whole;
//   return data;
// }