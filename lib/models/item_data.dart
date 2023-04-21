class ItemData {
  String? name;
  String? color;
  String? description;
  List<String>? images;

  ItemData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
    description = json['description'];
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images!.add(v.toString());
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['color'] = color;
    data['description'] = description;
    data['children'] = images;
    return data;
  }
}
