class TakeawayOrderResponse {
  final int? status;
  final bool? error;
  final String? message;
  final List<TakeawayOrderDetails>? takeawayOrders;

  TakeawayOrderResponse({
    this.status,
    this.error,
    this.message,
    this.takeawayOrders,
  });
}

class TakeawayOrderDetails {
  final String? billStatus;
  final int? orderMasterId;
  final String? orderNo;
  final dynamic mergeId;
  final String? createdDate;
  final String? grandTotal;
  final String? customerName;
  final String? phoneNo;
  final int? address;
  final String? remarks;
  final String? tokenNo;

  TakeawayOrderDetails({
    this.billStatus,
    this.orderMasterId,
    this.orderNo,
    this.mergeId,
    this.createdDate,
    this.grandTotal,
    this.customerName,
    this.phoneNo,
    this.address,
    this.remarks,
    this.tokenNo,
  });
}
