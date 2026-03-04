import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/sale_details_bymasterid_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/sales_details_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/repositories/salesreport_repository.dart';

class SalesDetailsByMasterIdUseCase
    implements
        UseCaseWithParams<
          SalesDetailsByMasterIdResult,
          FetchSalesDetailsRequest
        > {
  final SalesReportRepository _salesReportRepository;

  SalesDetailsByMasterIdUseCase(this._salesReportRepository);

  @override
  ResultFuture<SalesDetailsByMasterIdResult> call(
    FetchSalesDetailsRequest params,
  ) async {
    return _salesReportRepository.fetchSalesDetailsByMasterId(params);
  }
}
