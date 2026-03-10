import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_takeawayrunning_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/repositories/tables_repository.dart';

class FetchTakeawayOrdersUseCase
    implements UseCaseWithoutParams<TakeawayOrderResponseModel> {
  final TablesRepository _tablesRepository;

  FetchTakeawayOrdersUseCase(this._tablesRepository);

  @override
  ResultFuture<TakeawayOrderResponseModel> call() async {
    return _tablesRepository.fetchTakeawayOrders();
  }
}
