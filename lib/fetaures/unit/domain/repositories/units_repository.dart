import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/unit/data/models/fetch_unit_model.dart';

abstract class UnitsRepository {
  ResultFuture<FetchUnitResponseModel> fetchUnits();
}
