import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/sale_details_bymasterid_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/sales_details_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/masterresult.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/salesreport_entity.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/delete_salesparameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/sales_masterreport_bydate_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/salesreport_request_parameter.dart';

abstract class SalesReportRepository {
  ResultFuture<SalesReportResult> fetchSalesReport(FetchReportRequest request);
  ResultFuture<SalesDetailsByMasterIdResult> fetchSalesDetailsByMasterId(
    FetchSalesDetailsRequest request,
  );
  ResultFuture<MasterResult> deleteSalesFromServer(
    SalesDeleteByMasterIdRequest SalesDeleteRequest,
  );
  ResultFuture<SalesReportResult> fetchSalesReportMasterByDate(
    SalesReportMasterByDateRequest request,
  );
}
