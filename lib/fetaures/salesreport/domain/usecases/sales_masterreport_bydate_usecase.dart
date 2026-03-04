import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/salesreport_entity.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/sales_masterreport_bydate_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/repositories/salesreport_repository.dart';

class SalesReportMasterByDateUseCase
    implements
        UseCaseWithParams<SalesReportResult, SalesReportMasterByDateRequest> {
  final SalesReportRepository _repository;

  SalesReportMasterByDateUseCase(this._repository);

  @override
  ResultFuture<SalesReportResult> call(SalesReportMasterByDateRequest params) {
    return _repository.fetchSalesReportMasterByDate(params);
  }
}
