import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/unit/data/models/fetch_unit_model.dart';
import 'package:quickservtablemanagement/fetaures/unit/domain/usecases/fetch_units_usecase.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final FetchUnitsUseCase _fetchUnitsUseCase;

  UnitCubit({required FetchUnitsUseCase fetchUnitsUseCase})
    : _fetchUnitsUseCase = fetchUnitsUseCase,
      super(UnitInitial());

  /// 🔥 Called this method to fetch units
  Future<void> fetchUnits() async {
    emit(UnitLoading());

    final response = await _fetchUnitsUseCase();

    response.fold(
      (failure) => emit(UnitError(error: failure.message)),
      (response) => emit(UnitLoaded(units: response)),
    );
  }
}
