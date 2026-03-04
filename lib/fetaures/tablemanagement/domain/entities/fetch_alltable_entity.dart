class AllTablesResponseEntity {
  final int? status;
  final bool? error;
  final String? message;
  final Map<String, List<AllTableEntity>>? tables;

  AllTablesResponseEntity({this.status, this.error, this.message, this.tables});
}

class AllTableEntity {
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
  final bool? isRunning;
  final int? orderMasterId;
  final String? orderNo;
  final String? amount;

  AllTableEntity({
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
    this.isRunning,
    this.orderMasterId,
    this.orderNo,
    this.amount,
  });
}
