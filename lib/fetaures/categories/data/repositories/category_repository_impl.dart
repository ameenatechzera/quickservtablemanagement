import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/datasources/category_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/models/fetch_category_model.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/repositories/category_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource remoteDataSource;

  CategoriesRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchCategoryResponseModel> fetchCategories() async {
    try {
      final result = await remoteDataSource.fetchCategories();
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
