import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_orderdetails_entity.dart';

class FetchOrderDetailsResponseModel extends FetchOrderDetailsResponse {
  FetchOrderDetailsResponseModel({
    super.status,
    super.error,
    super.message,
    List<FetchOrderDetailsModel>? super.details,
  });

  factory FetchOrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return FetchOrderDetailsResponseModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      details: json['details'] != null
          ? List<FetchOrderDetailsModel>.from(
              json['details'].map((x) => FetchOrderDetailsModel.fromJson(x)),
            )
          : [],
    );
  }
}

class FetchOrderDetailsModel extends FetchOrderDetails {
  FetchOrderDetailsModel({
    super.tokedetailsid,
    super.tokenidOut,
    super.orderid,
    super.tokenno,
    super.productcode,
    super.productname,
    super.productDescription,
    super.qty,
    super.unitid,
    super.purchasecost,
    super.salesrate,
    super.excluderate,
    super.subtotal,
    super.vatid,
    super.vatamount,
    super.totalamount,
    super.branchidOut,
    super.createddate,
    super.createduser,
    super.modifieddate,
    super.modifieduser,
    super.ordermasterid,
    super.unitId,
    super.unitName,
    super.vatId,
    super.vatname,
    super.vatpercentage,
    super.tableNumber,
  });

  factory FetchOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return FetchOrderDetailsModel(
      tokedetailsid: json['tokedetailsid'],
      tokenidOut: json['tokenid_out'],
      orderid: json['orderid'],
      tokenno: json['tokenno'],
      productcode: json['productcode'],
      productname: json['productname'],
      productDescription: json['product_description'],
      qty: json['qty'],
      unitid: json['unitid'],
      purchasecost: json['purchasecost']?.toString(),
      salesrate: json['salesrate']?.toString(),
      excluderate: json['excluderate']?.toString(),
      subtotal: json['subtotal']?.toString(),
      vatid: json['vatid'],
      vatamount: json['vatamount']?.toString(),
      totalamount: json['totalamount']?.toString(),
      branchidOut: json['branchid_out'],
      createddate: json['createddate'],
      createduser: json['createduser']?.toString(),
      modifieddate: json['modifieddate'],
      modifieduser: json['modifieduser']?.toString(),
      ordermasterid: json['ordermasterid'],
      unitId: json['unit_id'],
      unitName: json['unit_name'],
      vatId: json['vat_id'],
      vatname: json['vatname'],
      vatpercentage: json['vatpercentage'],
      tableNumber: json['table_number'],
    );
  }
}
