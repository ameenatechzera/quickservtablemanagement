import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/groups/data/datasources/group_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/groups/data/models/fetch_group_model.dart';
import 'package:quickservtablemanagement/fetaures/groups/domain/repositories/group_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  final GroupsRemoteDataSource remoteDataSource;

  GroupsRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchGroupResponseModel> fetchGroups() async {
    try {
      final result = await remoteDataSource.fetchGroups();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }
}
