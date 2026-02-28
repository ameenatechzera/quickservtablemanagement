import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/entities/login_entity.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/entities/register_server_entity.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/parameters/login_params.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/parameters/register_server_params.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<RegisterResponseResult> registerServer(
    RegisterServerRequest registerServerParams,
  ) async {
    try {
      final result = await remoteDataSource.registerServer(
        registerServerParams,
      );

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  ResultFuture<LoginResponseResult> loginServer(
    LoginRequest loginRequest,
  ) async {
    try {
      final result = await remoteDataSource.loginServer(loginRequest);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  // @override
  // ResultFuture<MasterResponseModel> changePassword(
  //   ChangePasswordRequest request,
  // ) async {
  //   try {
  //     final result = await remoteDataSource.changePassword(request);

  //     return Right(result);
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  //   } on DioException catch (failure) {
  //     return Left(ServerFailure(failure.message.toString()));
  //   }
  // }
}
