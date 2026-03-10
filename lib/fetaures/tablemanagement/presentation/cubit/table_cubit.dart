import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_alltable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_table_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_takeawayrunning_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fethc_runningtable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/usecases/fetch_alltable_usecase.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/usecases/fetch_runningtable_usecase.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/usecases/fetch_table_usecase.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/usecases/fetch_takeawayrunning_usecase.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final FetchTablesUseCase _fetchTablesUseCase;
  final FetchRunningTablesUseCase _fetchRunningTablesUseCase;
  final FetchAllTablesUseCase _fetchAllTablesUseCase;
  final FetchTakeawayOrdersUseCase _fetchTakeawayOrdersUseCase;

  TableCubit({
    required FetchTablesUseCase fetchTablesUseCase,
    required FetchRunningTablesUseCase fetchRunningTablesUseCase,
    required FetchAllTablesUseCase fetchAllTablesUseCase,
    required FetchTakeawayOrdersUseCase fetchTakeawayOrdersUseCase,
  }) : _fetchTablesUseCase = fetchTablesUseCase,
       _fetchRunningTablesUseCase = fetchRunningTablesUseCase,
       _fetchAllTablesUseCase = fetchAllTablesUseCase,
       _fetchTakeawayOrdersUseCase = fetchTakeawayOrdersUseCase,
       super(TableInitial());

  /// =========================================================
  /// 🔵 FETCH ALL TABLES
  /// =========================================================
  Future<void> fetchTables() async {
    emit(TableLoading());

    try {
      log("FetchingTables...");

      final response = await _fetchTablesUseCase();

      log(response.toString(), name: 'result_tables');

      response.fold(
        (failure) {
          log("Fetch Tables Failure: ${failure.message}");
          emit(TableError(failure.message));
        },
        (success) {
          log("Fetch Tables Success");
          emit(TableLoaded(success));
        },
      );
    } catch (e) {
      log("Fetch Tables Exception: $e");
      emit(TableError('An error occurred: $e'));
    }
  }

  /// =========================================================
  /// 🔴 FETCH RUNNING TABLES
  /// =========================================================
  Future<void> fetchRunningTables() async {
    emit(RunningTableLoading());

    try {
      log("Fetching Running Tables...");

      final response = await _fetchRunningTablesUseCase();

      log(response.toString(), name: 'result_running_tables');

      response.fold(
        (failure) {
          log("Fetch Running Tables Failure: ${failure.message}");
          emit(RunningTableError(failure.message));
        },
        (success) {
          log("Fetch Running Tables Success");
          emit(RunningTableLoaded(success));
        },
      );
    } catch (e) {
      log("Fetch Running Tables Exception: $e");
      emit(RunningTableError('An error occurred: $e'));
    }
  }

  /// =========================================================
  /// 🟢 FETCH ALL TABLES (Grouped Indoor / Outdoor / Dinein)
  /// =========================================================
  Future<void> fetchAllTables() async {
    emit(AllTableLoading());

    try {
      log("Fetching All Tables ");

      final response = await _fetchAllTablesUseCase();

      log(response.toString(), name: 'result_all_tables');

      response.fold(
        (failure) {
          log("Fetch All Tables Failure: ${failure.message}");
          emit(AllTableError(failure.message));
        },
        (success) {
          log("Fetch All Tables Success");
          emit(AllTableLoaded(success));
        },
      );
    } catch (e) {
      log("Fetch All Tables Exception: $e");
      emit(AllTableError('An error occurred: $e'));
    }
  }

  /// =========================================================
  /// 🟣 FETCH TAKEAWAY ORDERS
  /// =========================================================
  Future<void> fetchTakeawayOrders() async {
    emit(TakeawayOrderLoading());

    try {
      log("Fetching Takeaway Orders...");

      final response = await _fetchTakeawayOrdersUseCase();

      log(response.toString(), name: 'result_takeaway_orders');

      response.fold(
        (failure) {
          log("Fetch Takeaway Orders Failure: ${failure.message}");
          emit(TakeawayOrderError(failure.message));
        },
        (success) {
          log("Fetch Takeaway Orders Success");
          emit(TakeawayOrderLoaded(success));
        },
      );
    } catch (e) {
      log("Fetch Takeaway Orders Exception: $e");
      emit(TakeawayOrderError('An error occurred: $e'));
    }
  }
}
