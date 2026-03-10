class FinishOrderResponse {
  final int? status;
  final bool? error;
  final String? message;
  final FinishOrderDetails? details;

  FinishOrderResponse({this.status, this.error, this.message, this.details});
}

class FinishOrderDetails {
  final int? salesMasterId;
  final String? invoiceNo;

  FinishOrderDetails({this.salesMasterId, this.invoiceNo});
}
