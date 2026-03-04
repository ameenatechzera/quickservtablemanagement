import 'package:quickservtablemanagement/fetaures/orderdetails/domain/entities/fetch_ordermaster_entity.dart';

class FetchOrderMasterModel extends FetchOrderMasterEntity {
  FetchOrderMasterModel({
    super.status,
    super.error,
    super.message,
    OrderMasterModel? super.details,
  });

  factory FetchOrderMasterModel.fromJson(Map<String, dynamic> json) {
    return FetchOrderMasterModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      details: json['details'] != null
          ? OrderMasterModel.fromJson(json['details'])
          : null,
    );
  }
}

class OrderMasterModel extends OrderMasterEntity {
  OrderMasterModel({
    super.orderMasterId,
    super.orderNo,
    super.orderDate,
    super.orderTime,
    super.ledgerId,
    super.subTotal,
    super.discountAmount,
    super.vatAmount,
    super.grandTotal,
    super.cashLedgerId,
    super.cashAmount,
    super.cardLedgerId,
    super.cardAmount,
    super.creditAmount,
    super.billStatus,
    super.tableId,
    super.userId,
    super.mergeStatus,
    super.mergeId,
    super.orderType,
    super.branchId,
    super.createdDate,
    super.createdUser,
    super.modifiedDate,
    super.modifiedUser,
    super.ledgerName,
    super.cashLedgerName,
    super.cardLedgerName,
    super.tokenGrandTotal,
    super.orderDetails,
  });

  factory OrderMasterModel.fromJson(Map<String, dynamic> json) {
    return OrderMasterModel(
      orderMasterId: json['OrderMasterId'],
      orderNo: json['OrderNo'],
      orderDate: json['OrderDate'],
      orderTime: json['OrderTime'],
      ledgerId: json['LedgerId'],
      subTotal: json['SubTotal'],
      discountAmount: json['DiscountAmount'],
      vatAmount: json['VatAmount'],
      grandTotal: json['GrandTotal'],
      cashLedgerId: json['CashLedgerId'],
      cashAmount: json['CashAmount'],
      cardLedgerId: json['CardLedgerID'],
      cardAmount: json['CardAmount'],
      creditAmount: json['creditAmount'],
      billStatus: json['BillStatus'],
      tableId: json['table_id'],
      userId: json['userId'],
      mergeStatus: json['mergeStatus'],
      mergeId: json['mergeId'],
      orderType: json['orderType'],
      branchId: json['branchId'],
      createdDate: json['CreatedDate'],
      createdUser: json['CreatedUser'],
      modifiedDate: json['ModifiedDate'],
      modifiedUser: json['ModifiedUser'],
      ledgerName: json['ledger_name'],
      cashLedgerName: json['cashledgername'],
      cardLedgerName: json['cardledgername'],
      tokenGrandTotal: json['tokengrandtotal'],
      orderDetails: json['orderDetails'] != null
          ? List<OrderItemModel>.from(
              json['orderDetails'].map((x) => OrderItemModel.fromJson(x)),
            )
          : [],
    );
  }
}

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    super.tokenDetailsId,
    super.tokenId,
    super.orderId,
    super.tokenNo,
    super.productCode,
    super.productName,
    super.productDescription,
    super.qty,
    super.unitId,
    super.purchaseCost,
    super.salesRate,
    super.excludeRate,
    super.subtotal,
    super.vatId,
    super.vatAmount,
    super.totalAmount,
    super.branchId,
    super.createdDate,
    super.createdUser,
    super.modifiedDate,
    super.modifiedUser,
    super.unitIdAlt,
    super.unitName,
    super.vatIdAlt,
    super.vatName,
    super.vatPercentage,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      tokenDetailsId: json['tokedetailsId'],
      tokenId: json['tokenId'],
      orderId: json['OrderId'],
      tokenNo: json['tokenNo'],
      productCode: json['ProductCode'],
      productName: json['ProductName'],
      productDescription: json['Product_description'],
      qty: json['Qty'],
      unitId: json['UnitId'],
      purchaseCost: json['PurchaseCost'],
      salesRate: json['SalesRate'],
      excludeRate: json['ExcludeRate'],
      subtotal: json['Subtotal'],
      vatId: json['VatId'],
      vatAmount: json['VatAmount'],
      totalAmount: json['TotalAmount'],
      branchId: json['branchId'],
      createdDate: json['CreatedDate'],
      createdUser: json['CreatedUser'],
      modifiedDate: json['ModifiedDate'],
      modifiedUser: json['ModifiedUser'],
      unitIdAlt: json['unit_id'],
      unitName: json['unit_name'],
      vatIdAlt: json['vat_id'],
      vatName: json['vatName'],
      vatPercentage: json['vatPercentage'],
    );
  }
}
