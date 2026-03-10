import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/finish_order_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/finish_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class FinishOrderUseCase
    implements
        UseCaseWithParams<FinishOrderResponseModel, FinishOrderParameter> {
  final OrderMasterRepository _repository;

  FinishOrderUseCase(this._repository);

  @override
  ResultFuture<FinishOrderResponseModel> call(
    FinishOrderParameter params,
  ) async {
    return _repository.finishOrder(params);
  }
}
