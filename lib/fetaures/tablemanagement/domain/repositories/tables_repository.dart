import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_alltable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_table_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fethc_runningtable_model.dart';

abstract class TablesRepository {
  ResultFuture<FetchTableResponseModel> fetchTables();
  ResultFuture<FetchRunningTableResponseModel> fetchRunningTables();
  ResultFuture<AllTablesResponseModel> fetchAllTables();
}
