import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/update_ordermasterwithtoken_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/update_ordermasterwithtoken_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class UpdateOrderMasterWithTokenUseCase
    implements
        UseCaseWithParams<
          UpdateOrderMasterWithTokenResponseModel,
          UpdateOrderMasterWithTokenParameter
        > {
  final OrderMasterRepository _repository;

  UpdateOrderMasterWithTokenUseCase(this._repository);

  @override
  ResultFuture<UpdateOrderMasterWithTokenResponseModel> call(
    UpdateOrderMasterWithTokenParameter params,
  ) async {
    return _repository.updateOrderMasterWithToken(params);
  }
}
