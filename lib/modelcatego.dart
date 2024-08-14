class Categories {
  int? id;
  String? name;
  Null? photoPath;

  Categories({this.id, this.name, this.photoPath});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photoPath = json['photoPath'];
  }
}
