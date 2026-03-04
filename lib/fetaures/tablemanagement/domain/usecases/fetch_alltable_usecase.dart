import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_alltable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/repositories/tables_repository.dart';

class FetchAllTablesUseCase
    implements UseCaseWithoutParams<AllTablesResponseModel> {
  final TablesRepository _tablesRepository;

  FetchAllTablesUseCase(this._tablesRepository);

  @override
  ResultFuture<AllTablesResponseModel> call() async {
    return _tablesRepository.fetchAllTables();
  }
}
