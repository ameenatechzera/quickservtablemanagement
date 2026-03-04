import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/sale_details_bymasterid_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/sales_details_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/data/datasources/salesreport_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/masterresult.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/salesreport_entity.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/delete_salesparameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/sales_masterreport_bydate_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/salesreport_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/repositories/salesreport_repository.dart';

class SalesReportRepositoryImpl implements SalesReportRepository {
  final SalesReportRemoteDataSource remoteDataSource;

  SalesReportRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<SalesReportResult> fetchSalesReport(
    FetchReportRequest request,
  ) async {
    try {
      final result = await remoteDataSource.fetchSalesReport(request);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  ResultFuture<SalesDetailsByMasterIdResult> fetchSalesDetailsByMasterId(
    FetchSalesDetailsRequest request,
  ) async {
    try {
      final result = await remoteDataSource.fetchSalesDetailsByMasterId(
        request,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  ResultFuture<SalesReportResult> fetchSalesReportMasterByDate(
    SalesReportMasterByDateRequest request,
  ) async {
    try {
      final result = await remoteDataSource.fetchSalesReportMasterByDate(
        request,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  ResultFuture<MasterResult> deleteSalesFromServer(
    SalesDeleteByMasterIdRequest SalesDeleteRequest,
  ) async {
    try {
      final result = await remoteDataSource.deleteSalesFromServer(
        SalesDeleteRequest,
      );

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message.toString()));
    }
  }
}
