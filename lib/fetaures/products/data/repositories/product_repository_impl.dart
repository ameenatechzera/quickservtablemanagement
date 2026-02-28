import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/products/data/datasources/product_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/products/data/models/fetch_product_model.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/repositories/product_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<FetchProductResponseModel> fetchProducts() async {
    try {
      final result = await remoteDataSource.fetchProducts();
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
