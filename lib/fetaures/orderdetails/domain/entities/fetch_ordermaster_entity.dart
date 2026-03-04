class FetchOrderMasterEntity {
  final int? status;
  final bool? error;
  final String? message;
  final OrderMasterEntity? details;

  FetchOrderMasterEntity({this.status, this.error, this.message, this.details});
}

class OrderMasterEntity {
  final int? orderMasterId;
  final String? orderNo;
  final String? orderDate;
  final String? orderTime;
  final int? ledgerId;
  final String? subTotal;
  final String? discountAmount;
  final String? vatAmount;
  final String? grandTotal;
  final int? cashLedgerId;
  final String? cashAmount;
  final int? cardLedgerId;
  final String? cardAmount;
  final String? creditAmount;
  final String? billStatus;
  final int? tableId;
  final int? userId;
  final String? mergeStatus;
  final int? mergeId;
  final String? orderType;
  final int? branchId;
  final String? createdDate;
  final String? createdUser;
  final String? modifiedDate;
  final String? modifiedUser;
  final String? ledgerName;
  final String? cashLedgerName;
  final String? cardLedgerName;
  final String? tokenGrandTotal;
  final List<OrderItemEntity>? orderDetails;

  OrderMasterEntity({
    this.orderMasterId,
    this.orderNo,
    this.orderDate,
    this.orderTime,
    this.ledgerId,
    this.subTotal,
    this.discountAmount,
    this.vatAmount,
    this.grandTotal,
    this.cashLedgerId,
    this.cashAmount,
    this.cardLedgerId,
    this.cardAmount,
    this.creditAmount,
    this.billStatus,
    this.tableId,
    this.userId,
    this.mergeStatus,
    this.mergeId,
    this.orderType,
    this.branchId,
    this.createdDate,
    this.createdUser,
    this.modifiedDate,
    this.modifiedUser,
    this.ledgerName,
    this.cashLedgerName,
    this.cardLedgerName,
    this.tokenGrandTotal,
    this.orderDetails,
  });
}

class OrderItemEntity {
  final int? tokenDetailsId;
  final int? tokenId;
  final int? orderId;
  final int? tokenNo;
  final String? productCode;
  final String? productName;
  final String? productDescription;
  final int? qty;
  final int? unitId;
  final String? purchaseCost;
  final String? salesRate;
  final String? excludeRate;
  final String? subtotal;
  final int? vatId;
  final String? vatAmount;
  final String? totalAmount;
  final int? branchId;
  final String? createdDate;
  final String? createdUser;
  final String? modifiedDate;
  final String? modifiedUser;
  final int? unitIdAlt;
  final String? unitName;
  final int? vatIdAlt;
  final String? vatName;
  final String? vatPercentage;

  OrderItemEntity({
    this.tokenDetailsId,
    this.tokenId,
    this.orderId,
    this.tokenNo,
    this.productCode,
    this.productName,
    this.productDescription,
    this.qty,
    this.unitId,
    this.purchaseCost,
    this.salesRate,
    this.excludeRate,
    this.subtotal,
    this.vatId,
    this.vatAmount,
    this.totalAmount,
    this.branchId,
    this.createdDate,
    this.createdUser,
    this.modifiedDate,
    this.modifiedUser,
    this.unitIdAlt,
    this.unitName,
    this.vatIdAlt,
    this.vatName,
    this.vatPercentage,
  });
}
