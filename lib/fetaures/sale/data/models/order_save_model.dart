import 'package:quickservtablemanagement/fetaures/sale/domain/entities/order_save_entity.dart';

class CreateOrderResponseModel extends CreateOrderEntity {
  CreateOrderResponseModel({
    super.status,
    super.error,
    super.message,
    OrderDetailsModel? super.details,
  });

  factory CreateOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderResponseModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      details: json['details'] != null
          ? OrderDetailsModel.fromJson(json['details'])
          : null,
    );
  }
}

class OrderDetailsModel extends OrderDetails {
  OrderDetailsModel({super.orderMasterId, super.orderNo, super.tokenNo});

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      orderMasterId: json['OrderMasterId'],
      orderNo: json['OrderNo'],
      tokenNo: json['tokenNo'],
    );
  }
}
