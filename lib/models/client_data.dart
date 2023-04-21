class ClientData {
  int? id;
  String? fullName;
  String? address;
  String? phoneNumber;
  String? description;
  String? images;

  ClientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    description = json['description'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['description'] = description;
    data['images'] = images;
    return data;
  }
}