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
}