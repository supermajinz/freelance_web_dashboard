part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

class GetWalletPayments extends WalletEvent {
  final int userId;

  const GetWalletPayments(this.userId);
}

class DepositToUserWallet extends WalletEvent {
  final int userId;
  final int amount;
  final DateTime transactionDate;
  final String type;

  const DepositToUserWallet(
    this.userId,
    this.amount,
    this.transactionDate, this.type,
  );
}

class WithdrawToUserWallet extends WalletEvent {
  final int userId;
  final int amount;
  final DateTime transactionDate;
  final String type = "WITHDRAW";

  const WithdrawToUserWallet(this.userId, this.amount, this.transactionDate);
}

class WithdrawFromUserWallet extends WalletEvent {
  final int userId;
  final int amount;
  final DateTime transactionDate;
  final String type;

  const WithdrawFromUserWallet({
    required this.userId,
    required this.amount,
    required this.transactionDate,
    required this.type,
  });

  @override
  List<Object> get props => [userId, amount, transactionDate, type];
}
