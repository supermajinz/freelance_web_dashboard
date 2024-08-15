import 'package:equatable/equatable.dart';

class TransactionRequest extends Equatable {
  final int? receiverUserId;
  final int? amount;
  final DateTime? transactionDate;
  final String? type; //COULD BE "DEPOSIT" OR "WITHDRAW"


  const TransactionRequest({
    this.receiverUserId,
    this.amount,
    this.transactionDate,
    this.type,

  });

  factory TransactionRequest.fromJson(Map<String, dynamic> json) {
    return TransactionRequest(
      receiverUserId: json['receiverUserId'] as int?,
      amount: json['amount'] as int?,
      transactionDate: json['transactionDate'] == null
          ? null
          : DateTime.parse(json['transactionDate'] as String),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'receiverUserId': receiverUserId,
        'amount': amount,
        'transactionDate': transactionDate?.toIso8601String(),
        'type': type,
      };

  TransactionRequest copyWith({
    int? receiverUserId,
    int? amount,
    DateTime? transactionDate,
    String? type,
    int? transactionNumber,
  }) {
    return TransactionRequest(
      receiverUserId: receiverUserId ?? this.receiverUserId,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props {
    return [
      receiverUserId,
      amount,
      transactionDate,
      type,
    ];
  }
}
