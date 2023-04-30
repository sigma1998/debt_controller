class ItemData {
  String? itemName;
  String? color;
  String? description;
  List<String>? images;

  static List<String>? toList(String? itemImages) {
    return itemImages?.split('#');
  }

  static String? toEntity(List<String>? images) {
    StringBuffer sb = StringBuffer();
    images?.forEach((element) {
      sb.write(sb.isEmpty ? element : '#$element');
    });
    return sb.toString();
  }
}