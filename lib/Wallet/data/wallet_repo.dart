import 'package:dartz/dartz.dart';
import 'package:dash/Wallet/data/models/transaction_request.dart';
import 'package:dash/Wallet/data/models/transaction_response.dart';
import 'package:dash/Wallet/data/models/wallet_payments_model.dart';
import 'package:dash/api%20integration/failures.dart';

abstract class WalletRepo {
  Future<Either<Failure, WalletPayments>> getWalletAndPayments(int userId);
  Future<Either<Failure, TransactionResponse>> trasnAct(
      TransactionRequest request);
}
