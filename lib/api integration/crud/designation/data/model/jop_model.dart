class JobModel {
  int? id;
  String? title;

  JobModel({this.id, this.title});

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
