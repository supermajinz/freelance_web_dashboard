import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? email;
  final int? points;
  final String? status;
  final String? deviceToken;

  const UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
    this.points,
    this.status,
    this.deviceToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        firstname: json['firstname'] as String?,
        lastname: json['lastname'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        points: json['points'] as int?,
        status: json['status'] as String?,
        deviceToken: json['device_token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'points': points,
        'status': status,
        'device_token': deviceToken,
      };

  UserModel copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? phone,
    String? email,
    int? points,
    String? status,
    String? deviceToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      points: points ?? this.points,
      status: status ?? this.status,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstname,
      lastname,
      phone,
      email,
      points,
      status,
      deviceToken,
    ];
  }
}
