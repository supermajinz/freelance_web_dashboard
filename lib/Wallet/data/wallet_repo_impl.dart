import 'package:dartz/dartz.dart';
import 'package:dash/Wallet/data/models/transaction_request.dart';
import 'package:dash/Wallet/data/models/transaction_response.dart';
import 'package:dash/Wallet/data/models/wallet_payments_model.dart';
import 'package:dash/Wallet/data/wallet_repo.dart';
import 'package:dash/api%20integration/api_service.dart';
import 'package:dash/api%20integration/failures.dart';
import 'package:dio/dio.dart';

class WalletRepoImpl extends WalletRepo {
  final ApiService _apiService;

  WalletRepoImpl(this._apiService);
  @override
  Future<Either<Failure, WalletPayments>> getWalletAndPayments(
      int userId) async {
    try {
      final response =
          await _apiService.get('wallets/with_transactions/$userId');
      return Right(WalletPayments.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionResponse>> trasnAct(
      TransactionRequest request) async {
    try {
      final response =
          await _apiService.post('transactions/admin', request.toJson());
      return Right(TransactionResponse.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
