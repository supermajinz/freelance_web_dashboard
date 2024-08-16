import 'package:equatable/equatable.dart';

import 'sender.dart';

class Report extends Equatable {
  final int? id;
  final String? message;
  final Sender? sender;
  final int? recipient;

  const Report({this.id, this.message, this.sender, this.recipient});

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json['id'] as int?,
        message: json['message'] as String?,
        sender: json['sender'] == null
            ? null
            : Sender.fromJson(json['sender'] as Map<String, dynamic>),
        recipient: json['recipient'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'sender': sender?.toJson(),
        'recipient': recipient,
      };

  Report copyWith({
    int? id,
    String? message,
    Sender? sender,
    int? recipient,
  }) {
    return Report(
      id: id ?? this.id,
      message: message ?? this.message,
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
    );
  }

  @override
  List<Object?> get props => [id, message, sender, recipient];
}
