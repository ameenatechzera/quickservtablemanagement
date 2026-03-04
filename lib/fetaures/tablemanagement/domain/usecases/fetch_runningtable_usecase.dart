import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fethc_runningtable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/repositories/tables_repository.dart';

class FetchRunningTablesUseCase
    implements UseCaseWithoutParams<FetchRunningTableResponseModel> {
  final TablesRepository _tablesRepository;

  FetchRunningTablesUseCase(this._tablesRepository);

  @override
  ResultFuture<FetchRunningTableResponseModel> call() async {
    return _tablesRepository.fetchRunningTables();
  }
}
