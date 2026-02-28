import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/unit/data/models/fetch_unit_model.dart';
import 'package:quickservtablemanagement/fetaures/unit/domain/repositories/units_repository.dart';

class FetchUnitsUseCase
    implements UseCaseWithoutParams<FetchUnitResponseModel> {
  final UnitsRepository _unitsRepository;

  FetchUnitsUseCase(this._unitsRepository);

  @override
  ResultFuture<FetchUnitResponseModel> call() async {
    return _unitsRepository.fetchUnits();
  }
}
