import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_ordermaster_entity.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class FetchOrderMasterUseCase
    implements
        UseCaseWithParams<FetchOrderMasterEntity, FetchOrderMasterParameter> {
  final OrderMasterRepository _repository;

  FetchOrderMasterUseCase(this._repository);

  @override
  ResultFuture<FetchOrderMasterEntity> call(
    FetchOrderMasterParameter params,
  ) async {
    return _repository.fetchOrderMaster(params);
  }
}
