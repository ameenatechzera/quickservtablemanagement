import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/order_save_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/order_save_parameter.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/repositories/orders_repository.dart';

class SaveOrderUseCase
    implements UseCaseWithParams<CreateOrderEntity, OrderSaveParameter> {
  final OrdersRepository _ordersRepository;

  SaveOrderUseCase(this._ordersRepository);

  @override
  ResultFuture<CreateOrderEntity> call(OrderSaveParameter params) async {
    return _ordersRepository.saveOrder(params);
  }
}
