// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:quickservtablemanagement/core/errors/exceptions.dart';
// import 'package:quickservtablemanagement/core/errors/failure.dart';
// import 'package:quickservtablemanagement/core/utils/typedef.dart';
// import 'package:quickservtablemanagement/fetaures/sale/data/datasources/sale_remote_data_source.dart';
// import 'package:quickservtablemanagement/fetaures/sale/domain/entities/sale_save_response_entity.dart';
// import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/sale_save_parameter.dart';
// import 'package:quickservtablemanagement/fetaures/sale/domain/repositories/sale_repository.dart';

// class SalesRepositoryImpl implements SalesRepository {
//   final SalesRemoteDataSource remoteDataSource;

//   SalesRepositoryImpl({required this.remoteDataSource});

//   @override
//   ResultFuture<SalesResponseEntity> saveSale(SaveSaleRequest request) async {
//     try {
//       final result = await remoteDataSource.saveSale(request);
//       return Right(result.toEntity());
//     } on ServerException catch (failure) {
//       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//     } on DioError catch (failure) {
//       return Left(ServerFailure(failure.message.toString()));
//     }
//   }
// }
