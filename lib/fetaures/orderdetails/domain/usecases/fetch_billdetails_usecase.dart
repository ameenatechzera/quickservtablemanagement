import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_billdetails_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_billdetails_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/billdetails_repository.dart';

class FetchBillDetailsUseCase
    implements
        UseCaseWithParams<FetchBillDetailsModel, FetchBillDetailsParameter> {
  final BillDetailsRepository _repository;

  FetchBillDetailsUseCase(this._repository);

  @override
  ResultFuture<FetchBillDetailsModel> call(
    FetchBillDetailsParameter params,
  ) async {
    return _repository.fetchBillDetails(params);
  }
}
