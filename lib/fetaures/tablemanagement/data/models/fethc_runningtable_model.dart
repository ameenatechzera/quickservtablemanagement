import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/entities/fetch_runningtable_entity.dart';

class FetchRunningTableResponseModel extends FetchRunningTableEntity {
  FetchRunningTableResponseModel({
    super.status,
    super.error,
    super.message,
    Map<String, List<RunningTableDetailsModel>>? super.tables,
  });

  factory FetchRunningTableResponseModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<RunningTableDetailsModel>> tableMap = {};

    if (json['tables'] != null) {
      json['tables'].forEach((key, value) {
        tableMap[key] = List<RunningTableDetailsModel>.from(
          value.map((x) => RunningTableDetailsModel.fromJson(x)),
        );
      });
    }

    return FetchRunningTableResponseModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      tables: tableMap,
    );
  }
}

class RunningTableDetailsModel extends RunningTableDetails {
  RunningTableDetailsModel({
    super.tableId,
    super.tableNumber,
    super.numberOfSeat,
    super.status,
    super.tableGroup,
    super.branchId,
    super.createdDate,
    super.createdUser,
    super.modifiedDate,
    super.modifiedUser,
    super.billStatus,
    super.grandTotal,
    super.orderMasterId,
    super.orderNo,
    super.mergeId,
    super.mergedTables,
  });

  factory RunningTableDetailsModel.fromJson(Map<String, dynamic> json) {
    return RunningTableDetailsModel(
      tableId: json['table_id'],
      tableNumber: json['table_number'],
      numberOfSeat: json['number_of_seat'],
      status: json['status'],
      tableGroup: json['table_group'],
      branchId: json['branchId'],
      createdDate: json['CreatedDate'],
      createdUser: json['CreatedUser'],
      modifiedDate: json['ModifiedDate'],
      modifiedUser: json['ModifiedUser'],
      billStatus: json['BillStatus'],
      grandTotal: json['GrandTotal'],
      orderMasterId: json['OrderMasterId'],
      orderNo: json['OrderNo'],
      mergeId: json['mergeId'],
      mergedTables: json['mergedTables'],
    );
  }
}
