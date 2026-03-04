import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_ordermaster_entity.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/usecases/fetch_ordermaster_usecase.dart';

part 'ordermaster_state.dart';

class OrderMasterCubit extends Cubit<OrderMasterState> {
  final FetchOrderMasterUseCase _fetchOrderMasterUseCase;

  OrderMasterCubit({required FetchOrderMasterUseCase fetchOrderMasterUseCase})
    : _fetchOrderMasterUseCase = fetchOrderMasterUseCase,
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
  }
}
