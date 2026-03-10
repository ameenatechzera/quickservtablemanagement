// import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_billdetails_entity.dart';

// class FetchBillDetailsModel extends FetchBillDetailsEntity {
//   FetchBillDetailsModel({
//     super.status,
//     super.error,
//     List<FetchBillDetailsDataModel>? super.data,
//   });

//   factory FetchBillDetailsModel.fromJson(Map<String, dynamic> json) {
//     return FetchBillDetailsModel(
//       status: json['status'],
//       error: json['error'],
//       data: json['data'] != null
//           ? List<FetchBillDetailsDataModel>.from(
//               json['data'].map((x) => FetchBillDetailsDataModel.fromJson(x)),
//             )
//           : [],
//     );
//   }
// }

// class FetchBillDetailsDataModel extends FetchBillDetailsData {
//   FetchBillDetailsDataModel({
//     super.orderMasterId,
//     super.orderNo,
//     super.tokenNo,
//     super.seatsUsed,
//     super.totalBillAmount,
//     super.customerName,
//     super.phoneNo,
//   });

//   factory FetchBillDetailsDataModel.fromJson(Map<String, dynamic> json) {
//     return FetchBillDetailsDataModel(
//       orderMasterId: json['OrderMasterId'],
//       orderNo: json['OrderNo']?.toString(),
//       tokenNo: json['TokenNo'],
//       seatsUsed: json['SeatsUsed'],
//       totalBillAmount: json['TotalBillAmount']?.toString(),
//       customerName: json['CustomerName']?.toString(),
//       phoneNo: json['PhoneNo']?.toString(),
//     );
//   }
// }
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_billdetails_entity.dart';

class FetchBillDetailsModel extends FetchBillDetailsEntity {
  FetchBillDetailsModel({
    super.status,
    super.error,
    List<FetchBillDetailsDataModel>? super.data,
  });

  factory FetchBillDetailsModel.fromJson(Map<String, dynamic> json) {
    return FetchBillDetailsModel(
      status: json['status'],
      error: json['error'],
      data: json['data'] != null
          ? List<FetchBillDetailsDataModel>.from(
              json['data'].map((x) => FetchBillDetailsDataModel.fromJson(x)),
            )
          : [],
    );
  }
}

class FetchBillDetailsDataModel extends FetchBillDetailsData {
  FetchBillDetailsDataModel({
    super.orderNo,
    super.orderMasterId,
    super.customerName,
    super.phoneNo,
    super.seatsUsed,
    List<TokenModel>? super.tokens,
    super.totalBillAmount,
  });

  factory FetchBillDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return FetchBillDetailsDataModel(
      orderNo: json['OrderNo']?.toString(),
      orderMasterId: json['OrderMasterId'],
      customerName: json['CustomerName']?.toString(),
      phoneNo: json['PhoneNo']?.toString(),
      seatsUsed: json['SeatsUsed'],
      tokens: json['tokens'] != null
          ? List<TokenModel>.from(
              json['tokens'].map((x) => TokenModel.fromJson(x)),
            )
          : [],
      totalBillAmount: (json['total_bill_amount'] as num?)?.toDouble(),
    );
  }
}

class TokenModel extends TokenEntity {
  TokenModel({super.tokenNo, super.billAmount});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      tokenNo: json['token_no'],
      billAmount: (json['bill_amount'] as num?)?.toDouble(),
    );
  }
}
