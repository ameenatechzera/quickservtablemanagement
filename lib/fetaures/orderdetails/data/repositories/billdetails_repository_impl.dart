import 'package:dartz/dartz.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/datasources/billdetails_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_billdetails_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_billdetails_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/billdetails_repository.dart';

class BillDetailsRepositoryImpl implements BillDetailsRepository {
  final BillDetailsRemoteDataSource remoteDataSource;

  BillDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchBillDetailsModel> fetchBillDetails(
    FetchBillDetailsParameter parameter,
  ) async {
    try {
      final result = await remoteDataSource.fetchBillDetails(parameter);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
