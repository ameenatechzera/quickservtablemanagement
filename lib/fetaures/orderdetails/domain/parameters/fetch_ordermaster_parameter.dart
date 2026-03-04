class FetchOrderMasterParameter {
  final int orderMasterId;
  final int branchId;

  FetchOrderMasterParameter({
    required this.orderMasterId,
    required this.branchId,
  });

  Map<String, dynamic> toJson() {
    return {"OrderMasterId": orderMasterId, "branchId": branchId};
  }
}
