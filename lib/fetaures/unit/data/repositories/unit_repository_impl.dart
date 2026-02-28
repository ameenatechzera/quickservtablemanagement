import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/unit/data/datasources/units_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/unit/data/models/fetch_unit_model.dart';
import 'package:quickservtablemanagement/fetaures/unit/domain/repositories/units_repository.dart';

class UnitsRepositoryImpl implements UnitsRepository {
  final UnitsRemoteDataSource remoteDataSource;

  UnitsRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchUnitResponseModel> fetchUnits() async {
    try {
      final result = await remoteDataSource.fetchUnits();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }
}
