import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/salesreport_entity.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/salesreport_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/repositories/salesreport_repository.dart';

class SalesReportFromServerUseCase
    implements UseCaseWithParams<SalesReportResult, FetchReportRequest> {
  final SalesReportRepository _salesReportRepository;

  SalesReportFromServerUseCase(this._salesReportRepository);

  @override
  ResultFuture<SalesReportResult> call(FetchReportRequest params) async {
    return _salesReportRepository.fetchSalesReport(params);
  }
}
