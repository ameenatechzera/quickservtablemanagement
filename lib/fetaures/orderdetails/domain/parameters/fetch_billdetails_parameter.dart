class FetchBillDetailsParameter {
  final String fromDate;
  final String toDate;
  final int userId;
  final int tableId;
  final String orderType;
  final int branchId;

  FetchBillDetailsParameter({
    required this.fromDate,
    required this.toDate,
    required this.userId,
    required this.tableId,
    required this.orderType,
    required this.branchId,
  });

  /// Convert to JSON for API call
  Map<String, dynamic> toJson() {
    return {
      "fromdate": fromDate,
      "todate": toDate,
      "userid": userId,
      "tableid": tableId,
      "ordertype": orderType,
      "branchid": branchId,
    };
  }
}
