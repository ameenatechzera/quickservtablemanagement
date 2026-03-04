import 'package:dartz/dartz.dart';
import 'package:quickservtablemanagement/core/errors/failure.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_ordermaster_entity.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';

abstract class OrderMasterRepository {
  Future<Either<Failure, FetchOrderMasterEntity>> fetchOrderMaster(
    FetchOrderMasterParameter parameter,
  );
}
