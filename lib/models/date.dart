class Date {
  int? day;
  int? month;
  int? year;
  String? whole;

  Date.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
    whole = json['whole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['month'] = month;
    data['year'] = year;
    data['whole'] = whole;
    return data;
  }
}