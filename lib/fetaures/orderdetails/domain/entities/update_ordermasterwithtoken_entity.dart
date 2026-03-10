class UpdateOrderMasterWithTokenResponse {
  final int? status;
  final bool? error;
  final String? message;
  final UpdateOrderMasterWithTokenDetails? details;

  UpdateOrderMasterWithTokenResponse({
    this.status,
    this.error,
    this.message,
    this.details,
  });
}

class UpdateOrderMasterWithTokenDetails {
  final int? orderMasterId;
  final String? orderNo;
  final int? tokenNo;

  UpdateOrderMasterWithTokenDetails({
    this.orderMasterId,
    this.orderNo,
    this.tokenNo,
  });
}
