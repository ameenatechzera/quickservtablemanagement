import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/datasources/settings_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/models/fetch_settings_model.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/common_result_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/toke_update_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/token_details_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/parameters/update_token_parameter.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchSettingsResponseModel> fetchSettings() async {
    try {
      final result = await remoteDataSource.fetchSettings();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }

  @override
  ResultFuture<CommonResult> refreshSalesToken() async {
    try {
      final result = await remoteDataSource.refreshSalesToken();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }

  @override
  ResultFuture<TokenDetailsResult> fetchCurrentSalesTokenDetails() async {
    try {
      final result = await remoteDataSource.fetchCurrentSalesToken();
      print('📊 API Response: ${result.toJson()}');
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  ResultFuture<TokenUpdateResult> updateSalesTokenToServer(
    UpdateSalesTokenRequest updateSalesTokenRequest,
  ) async {
    try {
      final result = await remoteDataSource.updateSalesTokenToServer(
        updateSalesTokenRequest,
      );
      print('📊 API Response: ${result.toJson()}');
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }
}
