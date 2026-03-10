import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/finish_order_entity.dart';

class FinishOrderResponseModel extends FinishOrderResponse {
  FinishOrderResponseModel({
    super.status,
    super.error,
    super.message,
    FinishOrderDetailsModel? super.details,
  });

  factory FinishOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return FinishOrderResponseModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      details: json['details'] != null
          ? FinishOrderDetailsModel.fromJson(json['details'])
          : null,
    );
  }
}

class FinishOrderDetailsModel extends FinishOrderDetails {
  FinishOrderDetailsModel({super.salesMasterId, super.invoiceNo});

  factory FinishOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return FinishOrderDetailsModel(
      salesMasterId: json['SalesMasterId'],
      invoiceNo: json['InvoiceNo']?.toString(),
    );
  }
}
