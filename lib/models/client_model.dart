
import 'package:debt_controller/db/local/client/client_entity.dart';

class ClientModel {
  int? id;
  String? fullName;
  String? address;
  String? phoneNumber;
  String? description;
  List<String>? images;

  ClientModel.fromEntity(ClientData data) {
    id = data.id;
    fullName = data.fullName;
    address = data.address;
    phoneNumber = data.phoneNumber;
    description = data.description;
    images = data.images?.split('#');
  }

  ClientData toEntity() {
    ClientData data = ClientData();
    data.id = id;
    data.fullName = fullName;
    data.address = address;
    data.phoneNumber = phoneNumber;
    data.description = description;
    var str = StringBuffer();
    images?.forEach((element) {
      str.write(str.isEmpty ? element : '#$element');
    });
    data.images = str.toString();
    return data;
  }
}