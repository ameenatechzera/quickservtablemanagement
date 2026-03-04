class CreateOrderEntity {
  final int? status;
  final bool? error;
  final String? message;
  final OrderDetails? details;

  CreateOrderEntity({this.status, this.error, this.message, this.details});
}

class OrderDetails {
  final int? orderMasterId;
  final String? orderNo;
  final int? tokenNo;

  OrderDetails({this.orderMasterId, this.orderNo, this.tokenNo});
}
