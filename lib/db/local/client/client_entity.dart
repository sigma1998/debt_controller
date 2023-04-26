import 'package:floor/floor.dart';

@Entity(tableName: 'client')
class ClientData {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? fullName;
  String? address;
  String? phoneNumber;
  String? description;
  String? images;


  ClientData({required this.fullName,required this.address,required this.phoneNumber,required this.description,this.images});
}