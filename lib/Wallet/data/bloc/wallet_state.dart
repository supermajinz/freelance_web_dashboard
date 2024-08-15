part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

class WalletPaymentsLoaded extends WalletState {
  final WalletPayments walletPayments;

  const WalletPaymentsLoaded(this.walletPayments);
}

class WalletLoading extends WalletState {}

class WalletError extends WalletState {
  final String errorMessage;

  const WalletError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class TransactionCompleted extends WalletState {
  final TransactionResponse response;

  const TransactionCompleted(this.response);
  
}
