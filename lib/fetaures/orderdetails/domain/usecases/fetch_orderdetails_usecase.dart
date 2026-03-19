import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_orderdetails_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_orderdetails_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class FetchOrderDetailsUseCase
    implements
        UseCaseWithParams<
          FetchOrderDetailsResponseModel,
          FetchOrderDetailsParameter
        > {
  final OrderMasterRepository _orderDetailsRepository;

  FetchOrderDetailsUseCase(this._orderDetailsRepository);

  @override
  ResultFuture<FetchOrderDetailsResponseModel> call(
    FetchOrderDetailsParameter parameter,
  ) async {
    return _orderDetailsRepository.fetchOrderDetails(parameter);
  }
}
