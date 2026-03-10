import 'package:quickservtablemanagement/core/models/master_api_response_model.dart';
import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/print_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/repositories/ordermaster_repository.dart';

class PrintPdfUseCase
    implements UseCaseWithParams<ApiResponseModel, PrintParameter> {
  final OrderMasterRepository _repository;

  PrintPdfUseCase(this._repository);

  @override
  ResultFuture<ApiResponseModel> call(PrintParameter params) async {
    return _repository.printVoucher(params);
  }
}
