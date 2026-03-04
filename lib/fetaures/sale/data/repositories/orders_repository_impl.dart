import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:dartz/dartz.dart';
import 'package:quickservtablemanagement/fetaures/sale/data/datasources/order_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/order_save_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/order_save_parameter.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<CreateOrderEntity> saveOrder(OrderSaveParameter params) async {
    try {
      final response = await remoteDataSource.saveOrder(params);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
