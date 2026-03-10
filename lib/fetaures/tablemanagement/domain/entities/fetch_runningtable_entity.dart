// class FetchRunningTableEntity {
//   final int? status;
//   final bool? error;
//   final String? message;
//   final Map<String, List<RunningTableDetails>>? tables;

//   const FetchRunningTableEntity({
//     this.status,
//     this.error,
//     this.message,
//     this.tables,
//   });
// }

// class RunningTableDetails {
//   final int? tableId;
//   final String? tableNumber;
//   final int? numberOfSeat;
//   final int? status;
//   final String? tableGroup;
//   final int? branchId;
//   final String? createdDate;
//   final String? createdUser;
//   final String? modifiedDate;
//   final String? modifiedUser;
//   final String? billStatus;
//   final String? grandTotal;
//   final String? orderMasterId;
//   final String? orderNo;
//   final dynamic mergeId;
//   final dynamic mergedTables;

//   const RunningTableDetails({
//     this.tableId,
//     this.tableNumber,
//     this.numberOfSeat,
//     this.status,
//     this.tableGroup,
//     this.branchId,
//     this.createdDate,
//     this.createdUser,
//     this.modifiedDate,
//     this.modifiedUser,
//     this.billStatus,
//     this.grandTotal,
//     this.orderMasterId,
//     this.orderNo,
//     this.mergeId,
//     this.mergedTables,
//   });
// }
class FetchRunningTableEntity {
  final int? status;
  final bool? error;
  final String? message;
  final Map<String, List<RunningTableDetails>>? tables;

  const FetchRunningTableEntity({
    this.status,
    this.error,
    this.message,
    this.tables,
  });
}

class RunningTableDetails {
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
  final List<OrderDetailsEntity>? orders;

  const RunningTableDetails({
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
    this.orders,
  });
}

class OrderDetailsEntity {
  final String? orderNo;
  final String? billStatus;
  final double? grandTotal;
  final int? orderMasterId;

  const OrderDetailsEntity({
    this.orderNo,
    this.billStatus,
    this.grandTotal,
    this.orderMasterId,
  });
}
