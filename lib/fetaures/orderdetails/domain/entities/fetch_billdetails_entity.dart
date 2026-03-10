// class FetchBillDetailsEntity {
//   final int? status;
//   final bool? error;
//   final List<FetchBillDetailsData>? data;

//   FetchBillDetailsEntity({this.status, this.error, this.data});
// }

// class FetchBillDetailsData {
//   final int? orderMasterId;
//   final String? orderNo;
//   final int? tokenNo;
//   final int? seatsUsed;
//   final String? totalBillAmount;
//   final String? customerName;
//   final String? phoneNo;

//   FetchBillDetailsData({
//     this.orderMasterId,
//     this.orderNo,
//     this.tokenNo,
//     this.seatsUsed,
//     this.totalBillAmount,
//     this.customerName,
//     this.phoneNo,
//   });
// }
class FetchBillDetailsEntity {
  final int? status;
  final bool? error;
  final List<FetchBillDetailsData>? data;

  FetchBillDetailsEntity({this.status, this.error, this.data});
}

class FetchBillDetailsData {
  final String? orderNo;
  final int? orderMasterId;
  final String? customerName;
  final String? phoneNo;
  final int? seatsUsed;
  final List<TokenEntity>? tokens;
  final double? totalBillAmount;

  FetchBillDetailsData({
    this.orderNo,
    this.orderMasterId,
    this.customerName,
    this.phoneNo,
    this.seatsUsed,
    this.tokens,
    this.totalBillAmount,
  });
}

class TokenEntity {
  final int? tokenNo;
  final double? billAmount;

  TokenEntity({this.tokenNo, this.billAmount});
}
