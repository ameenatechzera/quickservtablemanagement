import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/sale_save_response_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/sale_save_parameter.dart';

abstract class SalesRepository {
  ResultFuture<SalesResponseEntity> saveSale(SaveSaleRequest request);
}
