import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/update_ordermasterwithtoken_entity.dart';

class UpdateOrderMasterWithTokenResponseModel
    extends UpdateOrderMasterWithTokenResponse {
  UpdateOrderMasterWithTokenResponseModel({
    super.status,
    super.error,
    super.message,
    UpdateOrderMasterWithTokenDetailsModel? super.details,
  });

  factory UpdateOrderMasterWithTokenResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateOrderMasterWithTokenResponseModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      details: json['details'] != null
          ? UpdateOrderMasterWithTokenDetailsModel.fromJson(json['details'])
          : null,
    );
  }
}

class UpdateOrderMasterWithTokenDetailsModel
    extends UpdateOrderMasterWithTokenDetails {
  UpdateOrderMasterWithTokenDetailsModel({
    super.orderMasterId,
    super.orderNo,
    super.tokenNo,
  });

  factory UpdateOrderMasterWithTokenDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateOrderMasterWithTokenDetailsModel(
      orderMasterId: json['OrderMasterId'],
      orderNo: json['OrderNo']?.toString(),
      tokenNo: json['tokenNo'],
    );
  }
}
