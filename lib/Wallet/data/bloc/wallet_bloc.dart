import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dash/Wallet/data/models/transaction_request.dart';
import 'package:dash/Wallet/data/models/transaction_response.dart';
import 'package:dash/Wallet/data/models/wallet_payments_model.dart';
import 'package:dash/Wallet/data/wallet_repo.dart';
import 'package:equatable/equatable.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepo _walletRepo;
  WalletBloc(this._walletRepo) : super(WalletInitial()) {
    on<GetWalletPayments>(_getWalletPayment);
    on<DepositToUserWallet>(_depositToUserWallet);
     on<WithdrawFromUserWallet>(_withdrawFromUserWallet);
  }
  FutureOr<void> _getWalletPayment(
      GetWalletPayments event, Emitter<WalletState> emit) async {
    final result = await _walletRepo.getWalletAndPayments(event.userId);
    result.fold((failure) => emit(WalletError(failure.errMessage)),
        (wallet) => emit(WalletPaymentsLoaded(wallet)));
  }

  FutureOr<void> _depositToUserWallet(
      DepositToUserWallet event, Emitter<WalletState> emit) async {
    emit(WalletLoading());
    final result = await _walletRepo.trasnAct(TransactionRequest(
        amount: event.amount,
        receiverUserId: event.userId,
        transactionDate: event.transactionDate,
        type: event.type));
    result.fold((failure) => emit(WalletError(failure.errMessage)),
        (response) => emit(TransactionCompleted(response)));
  }
  
  FutureOr<void> _withdrawFromUserWallet(
      WithdrawFromUserWallet event, Emitter<WalletState> emit) async {
    emit(WalletLoading());
    final result = await _walletRepo.trasnAct(TransactionRequest(
        amount: event.amount,
        receiverUserId: event.userId,
        transactionDate: event.transactionDate,
        type: event.type));
    result.fold((failure) => emit(WalletError(failure.errMessage)),
        (response) => emit(TransactionCompleted(response)));
  }
}

