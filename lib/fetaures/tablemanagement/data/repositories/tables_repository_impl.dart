import 'package:dartz/dartz.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/datasources/table_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_alltable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_table_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fethc_runningtable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/repositories/tables_repository.dart';

class TablesRepositoryImpl implements TablesRepository {
  final TablesRemoteDataSource remoteDataSource;

  TablesRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchTableResponseModel> fetchTables() async {
    try {
      final result = await remoteDataSource.fetchTables();

      return Right(result); // ✅ Wrap inside Right
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// ---------------- FETCH RUNNING TABLES ----------------
  @override
  ResultFuture<FetchRunningTableResponseModel> fetchRunningTables() async {
    try {
      final result = await remoteDataSource.fetchRunningTables();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<AllTablesResponseModel> fetchAllTables() async {
    try {
      final result = await remoteDataSource.fetchAllTables();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
