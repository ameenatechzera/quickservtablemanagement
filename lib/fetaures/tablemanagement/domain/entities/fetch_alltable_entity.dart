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
  final List<OrderDetailsEntity>? orders;
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
    this.orders,
  });
}

class OrderDetailsEntity {
  final int? orderMasterId;
  final String? orderNo;
  final double? grandTotal;

  OrderDetailsEntity({this.orderMasterId, this.orderNo, this.grandTotal});
}
