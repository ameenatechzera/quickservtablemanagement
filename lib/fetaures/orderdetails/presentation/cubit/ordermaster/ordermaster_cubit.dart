import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/core/models/master_api_response_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_ordermaster_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/finish_order_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/update_ordermasterwithtoken_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/finish_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/print_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/update_ordermasterwithtoken_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/usecases/fetch_ordermaster_usecase.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/usecases/finish_order_usecase.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/usecases/print_pdf_usecase.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/usecases/update_ordermasterwithtoken_usecase.dart';

part 'ordermaster_state.dart';

class OrderMasterCubit extends Cubit<OrderMasterState> {
  final FetchOrderMasterUseCase _fetchOrderMasterUseCase;
  final FinishOrderUseCase _finishOrderUseCase;
  final PrintPdfUseCase _printPdfUseCase;
  final UpdateOrderMasterWithTokenUseCase _updateOrderMasterWithTokenUseCase;
  OrderMasterCubit({
    required FetchOrderMasterUseCase fetchOrderMasterUseCase,
    required FinishOrderUseCase finishOrderUseCase,
    required PrintPdfUseCase printPdfUseCase,
    required UpdateOrderMasterWithTokenUseCase
    updateOrderMasterWithTokenUseCase,
  }) : _fetchOrderMasterUseCase = fetchOrderMasterUseCase,
       _finishOrderUseCase = finishOrderUseCase,
       _printPdfUseCase = printPdfUseCase,
       _updateOrderMasterWithTokenUseCase = updateOrderMasterWithTokenUseCase,
       super(OrderMasterInitial());

  Future<void> fetchOrderMaster(FetchOrderMasterParameter parameter) async {
    emit(OrderMasterLoading());

    try {
      final response = await _fetchOrderMasterUseCase(parameter);

      response.fold(
        (failure) {
          log("OrderMaster Failure");
          emit(OrderMasterError(failure.message));
        },
        (success) {
          log(success.message ?? "Order fetched successfully");
          emit(OrderMasterLoaded(success));
        },
      );
    } catch (e) {
      emit(OrderMasterError('An error occurred: $e'));
    }
  } // Finish Order

  Future<void> finishOrder(FinishOrderParameter parameter) async {
    emit(FinishOrderLoading());

    try {
      final response = await _finishOrderUseCase(parameter);

      response.fold(
        (failure) {
          log("FinishOrder Failure: ${failure.message}");
          emit(FinishOrderError(failure.message));
        },
        (success) {
          log(success.message ?? "Order finished successfully");
          emit(FinishOrderLoaded(success));
        },
      );
    } catch (e) {
      emit(FinishOrderError('An error occurred: $e'));
    }
  }

  Future<void> printPdf(PrintParameter parameter) async {
    emit(PrintPdfLoading());

    try {
      final response = await _printPdfUseCase(parameter);

      response.fold(
        (failure) {
          log("PrintPdf Failure: ${failure.message}");
          emit(PrintPdfError(failure.message));
        },
        (success) {
          log(success.message);
          emit(PrintPdfLoaded(success));
        },
      );
    } catch (e) {
      emit(PrintPdfError('An error occurred: $e'));
    }
  }

  Future<void> updateOrderMasterWithToken(
    UpdateOrderMasterWithTokenParameter parameter,
  ) async {
    emit(UpdateOrderMasterLoading());

    try {
      final response = await _updateOrderMasterWithTokenUseCase(parameter);

      response.fold(
        (failure) {
          log("UpdateOrderMaster Failure: ${failure.message}");
          emit(UpdateOrderMasterError(failure.message));
        },
        (success) {
          log(success.message ?? "Order updated successfully");
          emit(UpdateOrderMasterLoaded(success));
        },
      );
    } catch (e) {
      emit(UpdateOrderMasterError('An error occurred: $e'));
    }
  }
}
