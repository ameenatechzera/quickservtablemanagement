import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/entities/fetch_takeawayrunning_entity.dart';

class TakeawayOrderResponseModel extends TakeawayOrderResponse {
  TakeawayOrderResponseModel({
    super.status,
    super.error,
    super.message,
    List<TakeawayOrderDetailsModel>? super.takeawayOrders,
  });

  factory TakeawayOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return TakeawayOrderResponseModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      takeawayOrders: json['takeawayOrders'] != null
          ? List<TakeawayOrderDetailsModel>.from(
              json['takeawayOrders'].map(
                (x) => TakeawayOrderDetailsModel.fromJson(x),
              ),
            )
          : [],
    );
  }
}

class TakeawayOrderDetailsModel extends TakeawayOrderDetails {
  TakeawayOrderDetailsModel({
    super.billStatus,
    super.orderMasterId,
    super.orderNo,
    super.mergeId,
    super.createdDate,
    super.grandTotal,
    super.customerName,
    super.phoneNo,
    super.address,
    super.remarks,
    super.tokenNo,
  });

  factory TakeawayOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return TakeawayOrderDetailsModel(
      billStatus: json['BillStatus'],
      orderMasterId: json['OrderMasterId'],
      orderNo: json['OrderNo'],
      mergeId: json['mergeId'],
      createdDate: json['CreatedDate'],
      grandTotal: json['GrandTotal']?.toString(),
      customerName: json['customerName'],
      phoneNo: json['phoneNo'],
      address: json['address'],
      remarks: json['remarks'],
      tokenNo: json['tokenNo']?.toString(),
    );
  }
}
