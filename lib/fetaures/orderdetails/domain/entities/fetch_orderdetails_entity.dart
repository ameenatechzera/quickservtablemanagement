class FetchOrderDetailsResponse {
  final int? status;
  final bool? error;
  final String? message;
  final List<FetchOrderDetails>? details;

  FetchOrderDetailsResponse({
    this.status,
    this.error,
    this.message,
    this.details,
  });
}

class FetchOrderDetails {
  final int? tokedetailsid;
  final int? tokenidOut;
  final int? orderid;
  final int? tokenno;
  final String? productcode;
  final String? productname;
  final String? productDescription;
  final int? qty;
  final int? unitid;
  final String? purchasecost;
  final String? salesrate;
  final String? excluderate;
  final String? subtotal;
  final int? vatid;
  final String? vatamount;
  final String? totalamount;
  final int? branchidOut;
  final String? createddate;
  final String? createduser;
  final String? modifieddate;
  final String? modifieduser;
  final int? ordermasterid;
  final int? unitId;
  final String? unitName;
  final int? vatId;
  final String? vatname;
  final int? vatpercentage;
  final String? tableNumber;

  FetchOrderDetails({
    this.tokedetailsid,
    this.tokenidOut,
    this.orderid,
    this.tokenno,
    this.productcode,
    this.productname,
    this.productDescription,
    this.qty,
    this.unitid,
    this.purchasecost,
    this.salesrate,
    this.excluderate,
    this.subtotal,
    this.vatid,
    this.vatamount,
    this.totalamount,
    this.branchidOut,
    this.createddate,
    this.createduser,
    this.modifieddate,
    this.modifieduser,
    this.ordermasterid,
    this.unitId,
    this.unitName,
    this.vatId,
    this.vatname,
    this.vatpercentage,
    this.tableNumber,
  });
}
