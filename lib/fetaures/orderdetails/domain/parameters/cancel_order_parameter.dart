class CancelOrderParameter {
  final List<int>? orderMasterIds;
  final List<int>? tableIds;
  final int? branchId;

  CancelOrderParameter({this.orderMasterIds, this.tableIds, this.branchId});

  Map<String, dynamic> toJson() {
    return {
      "orderMasterIds": orderMasterIds,
      "table_ids": tableIds,
      "branchId": branchId,
    };
  }
}
