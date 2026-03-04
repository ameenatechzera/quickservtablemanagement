import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_table_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/repositories/tables_repository.dart';

class FetchTablesUseCase
    implements UseCaseWithoutParams<FetchTableResponseModel> {
  final TablesRepository _tablesRepository;

  FetchTablesUseCase(this._tablesRepository);

  @override
  ResultFuture<FetchTableResponseModel> call() async {
    return _tablesRepository.fetchTables();
  }
}
