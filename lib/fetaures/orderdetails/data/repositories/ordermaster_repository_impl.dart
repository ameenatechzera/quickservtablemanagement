import 'package:dartz/dartz.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/models/master_api_response_model.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/datasources/ordermaster_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_ordermaster_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/finish_order_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/update_ordermasterwithtoken_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/finish_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/print_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/update_ordermasterwithtoken_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class OrderMasterRepositoryImpl implements OrderMasterRepository {
  final OrderMasterRemoteDataSource remoteDataSource;

  OrderMasterRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchOrderMasterModel> fetchOrderMaster(
    FetchOrderMasterParameter parameter,
  ) async {
    try {
      // 🔹 Convert domain param → model
      final paramModel = FetchOrderMasterParameter(
        orderMasterId: parameter.orderMasterId,
        branchId: parameter.branchId,
      );

      final result = await remoteDataSource.fetchOrderMaster(paramModel);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<FinishOrderResponseModel> finishOrder(
    FinishOrderParameter parameter,
  ) async {
    try {
      final result = await remoteDataSource.finishOrder(parameter);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<ApiResponseModel> printVoucher(PrintParameter parameter) async {
    try {
      final result = await remoteDataSource.printVoucher(parameter);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<UpdateOrderMasterWithTokenResponseModel>
  updateOrderMasterWithToken(
    UpdateOrderMasterWithTokenParameter parameter,
  ) async {
    try {
      final result = await remoteDataSource.updateOrderMasterWithToken(
        parameter,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
