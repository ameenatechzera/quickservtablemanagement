class FetchTableEntity {
  final int? status;
  final bool? error;
  final String? message;
  final Map<String, List<TableDetails>>? tables;

  FetchTableEntity({this.status, this.error, this.message, this.tables});
}

class TableDetails {
  final int? tableId;
  final String? tableNumber;
  final int? numberOfSeat;
  final int? status;
  final String? tableGroup;
  final int? branchId;
  final String? createdDate;
  final String? createdUser;
  final String? modifiedDate;
  final String? modifiedUser;

  TableDetails({
    this.tableId,
    this.tableNumber,
    this.numberOfSeat,
    this.status,
    this.tableGroup,
    this.branchId,
    this.createdDate,
    this.createdUser,
    this.modifiedDate,
    this.modifiedUser,
  });
}
