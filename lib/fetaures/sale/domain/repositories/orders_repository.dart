import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/order_save_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/order_save_parameter.dart';

abstract class OrdersRepository {
  ResultFuture<CreateOrderEntity> saveOrder(OrderSaveParameter params);
}
