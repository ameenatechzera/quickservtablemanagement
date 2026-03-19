import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/core/models/master_api_response_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/cancel_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class CancelOrderUseCase
    implements UseCaseWithParams<ApiResponseModel, CancelOrderParameter> {
  final OrderMasterRepository _repository;

  CancelOrderUseCase(this._repository);

  @override
  ResultFuture<ApiResponseModel> call(CancelOrderParameter params) async {
    return _repository.cancelOrder(params);
  }
}
