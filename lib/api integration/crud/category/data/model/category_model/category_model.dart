import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final dynamic photoPath;

  const CategoryModel({required this.id, required this.name, this.photoPath});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int,
        name: json['name'] as String,
        photoPath: json['photoPath'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoPath': photoPath,
      };

  @override
  List<Object?> get props => [id, name, photoPath];
}
