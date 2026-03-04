import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/entities/fetch_table_entity.dart';

class FetchTableResponseModel extends FetchTableEntity {
  FetchTableResponseModel({
    super.status,
    super.error,
    super.message,
    Map<String, List<TableDetailsModel>>? super.tables,
  });

  factory FetchTableResponseModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<TableDetailsModel>> tableMap = {};

    if (json['tables'] != null) {
      json['tables'].forEach((key, value) {
        tableMap[key] = List<TableDetailsModel>.from(
          value.map((x) => TableDetailsModel.fromJson(x)),
        );
      });
    }

    return FetchTableResponseModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      tables: tableMap,
    );
  }
}

class TableDetailsModel extends TableDetails {
  TableDetailsModel({
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
  });

  factory TableDetailsModel.fromJson(Map<String, dynamic> json) {
    return TableDetailsModel(
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
    );
  }
}
