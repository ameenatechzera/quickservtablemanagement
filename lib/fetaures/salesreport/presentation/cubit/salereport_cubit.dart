import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/entities/sale_details_bymasterid_entity.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/sales_details_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/usecases/sales_detailsbymasterid_usecase.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/salesreport_entity.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/sales_masterreport_bydate_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/salesreport_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/usecases/sales_masterreport_bydate_usecase.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/usecases/salesreport_fromserver_usecase.dart';

part 'salereport_state.dart';

class SalesReportCubit extends Cubit<SlesReportState> {
  final SalesReportFromServerUseCase _salesReportFromServerUseCase;
  final SalesDetailsByMasterIdUseCase _salesDetailsByMasterIdUseCase;
  final SalesReportMasterByDateUseCase _salesReportMasterByDateUseCase;
  //final DeleteSalesFromServerUseCase _deleteSalesFromServerUseCase;

  SalesReportCubit({
    required SalesReportFromServerUseCase salesReportFromServerUseCase,
    required SalesDetailsByMasterIdUseCase salesDetailsByMasterIdUseCase,
    required SalesReportMasterByDateUseCase salesReportMasterByDateUseCase,
    //required DeleteSalesFromServerUseCase deleteSalesFromServerUseCase,
  }) : _salesReportFromServerUseCase = salesReportFromServerUseCase,
       _salesDetailsByMasterIdUseCase = salesDetailsByMasterIdUseCase,
       _salesReportMasterByDateUseCase = salesReportMasterByDateUseCase,
       //_deleteSalesFromServerUseCase = deleteSalesFromServerUseCase,
       super(SlesReportInitial());

  // --------------------- API Fetch SalesReport ---------------------
  Future<void> fetchSalesReport(FetchReportRequest request) async {
    print('FetchReportRequest ${request.toJson()}');
    emit(SlesReportInitial());

    try {
      final response = await _salesReportFromServerUseCase(request);

      response.fold(
        (failure) => emit(SalesReportError(error: failure.message)),
        (saleResponse) => emit(SalesReportSuccess(response: saleResponse)),
      );
    } catch (e) {
      emit(SalesReportError(error: e.toString()));
    }
  }

  // --------------------- API Fetch SalesDetails By MasterId ---------------------
  Future<void> fetchSalesDetailsByMasterId(
    FetchSalesDetailsRequest request,
  ) async {
    emit(SlesDetailsInitial());

    try {
      final response = await _salesDetailsByMasterIdUseCase(request);

      response.fold(
        (failure) => emit(SalesDetailsError(error: failure.message)),
        (saleResponse) => emit(SalesDetailsSuccess(response: saleResponse)),
      );
    } catch (e) {
      emit(SalesDetailsError(error: e.toString()));
    }
  }

  // --------------------- API Fetch Bill Save_finished ---------------------
  Future<void> saleSaveFinished(int seconds_timer) async {
    await Future.delayed(Duration(seconds: seconds_timer));
    emit(SaleFinishSuccess(response: 'success'));
  }
  // --------------------- API Fetch SalesReport Master By Date ---------------------

  Future<void> fetchSalesReportMasterByDate(
    SalesReportMasterByDateRequest request,
  ) async {
    emit(SalesReportMasterByDateInitial());

    try {
      final response = await _salesReportMasterByDateUseCase(request);

      response.fold(
        (failure) => emit(SalesReportMasterByDateError(error: failure.message)),
        (saleResponse) {
          final salesList = saleResponse.salesMaster;

          final totalSalesCount = salesList.length;

          final totalSalesAmount = salesList.fold<double>(
            0.0,
            (sum, item) =>
                sum + (double.tryParse(item.grandTotal.toString()) ?? 0.0),
          );

          final cashBalance = salesList.fold<double>(
            0.0,
            (sum, item) =>
                sum + (double.tryParse(item.cashAmount.toString()) ?? 0.0),
          );

          emit(
            SalesReportMasterByDateSuccess(
              response: saleResponse,
              totalSalesCount: totalSalesCount,
              totalSalesAmount: totalSalesAmount,
              cashBalance: cashBalance,
            ),
          );
        },
      );
    } catch (e) {
      emit(SalesReportMasterByDateError(error: e.toString()));
    }
  }
}
