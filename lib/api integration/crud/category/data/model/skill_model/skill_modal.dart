import 'package:equatable/equatable.dart';

class SkillModal extends Equatable {
  final int id;
  final String name;

  const SkillModal({required this.id, required this.name});

  factory SkillModal.fromJson(Map<String, dynamic> json) => SkillModal(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
