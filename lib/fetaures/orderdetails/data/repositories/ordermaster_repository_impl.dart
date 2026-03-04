import 'package:dartz/dartz.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/datasources/ordermaster_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_ordermaster_entity.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class OrderMasterRepositoryImpl implements OrderMasterRepository {
  final OrderMasterRemoteDataSource remoteDataSource;

  OrderMasterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, FetchOrderMasterEntity>> fetchOrderMaster(
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
}
