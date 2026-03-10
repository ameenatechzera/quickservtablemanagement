import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_ordermaster_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class FetchOrderMasterUseCase
    implements
        UseCaseWithParams<FetchOrderMasterModel, FetchOrderMasterParameter> {
  final OrderMasterRepository _repository;

  FetchOrderMasterUseCase(this._repository);

  @override
  ResultFuture<FetchOrderMasterModel> call(
    FetchOrderMasterParameter params,
  ) async {
    return _repository.fetchOrderMaster(params);
  }
}
