import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_billdetails_entity.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_billdetails_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/usecases/fetch_billdetails_usecase.dart';

part 'billdetails_state.dart';

class BilldetailsCubit extends Cubit<BilldetailsState> {
  final FetchBillDetailsUseCase _fetchBillDetailsUseCase;

  BilldetailsCubit({required FetchBillDetailsUseCase fetchBillDetailsUseCase})
    : _fetchBillDetailsUseCase = fetchBillDetailsUseCase,
      super(BilldetailsInitial());

  Future<void> fetchBillDetails(FetchBillDetailsParameter parameter) async {
    emit(BilldetailsLoading());

    try {
      final response = await _fetchBillDetailsUseCase(parameter);

      response.fold(
        (failure) {
          log("BillDetails Failure");
          emit(BilldetailsError(failure.message));
        },
        (success) {
          emit(BilldetailsLoaded(success));
        },
      );
    } catch (e) {
      emit(BilldetailsError('An error occurred: $e'));
    }
  }
}
