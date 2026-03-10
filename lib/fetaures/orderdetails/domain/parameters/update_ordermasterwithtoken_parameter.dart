class UpdateOrderMasterWithTokenParameter {
  final int? orderMasterId;
  final String? orderNo;
  final double? grandTotal;
  final String? billStatus;
  final int? salesMasterId;
  final int? branchId;
  final int? tableId;
  final String? createdUser;
  final List<OrderDetailsParameter>? orderDetails;

  UpdateOrderMasterWithTokenParameter({
    required this.orderMasterId,
    required this.orderNo,
    required this.grandTotal,
    required this.billStatus,
    required this.salesMasterId,
    required this.branchId,
    required this.tableId,
    required this.createdUser,
    required this.orderDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      "OrderMasterId": orderMasterId,
      "OrderNo": orderNo,
      "grand_total": grandTotal,
      "billStatus": billStatus,
      "salesMasterId": salesMasterId,
      "branchId": branchId,
      "table_id": tableId,
      "CreatedUser": createdUser,
      "orderDetails": orderDetails?.map((e) => e.toJson()).toList(),
    };
  }
}

class OrderDetailsParameter {
  final String? productCode;
  final String? productName;
  final String? productDescription;
  final int? qty;
  final int? unitId;
  final double? purchaseCost;
  final double? salesRate;
  final double? excludeRate;
  final double? subtotal;
  final int? vatId;
  final double? vatAmount;
  final double? totalAmount;
  final int? groupId;

  OrderDetailsParameter({
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
    this.groupId,
  });

  Map<String, dynamic> toJson() {
    return {
      "ProductCode": productCode,
      "ProductName": productName,
      "Product_description": productDescription,
      "Qty": qty,
      "UnitId": unitId,
      "PurchaseCost": purchaseCost,
      "SalesRate": salesRate,
      "ExcludeRate": excludeRate,
      "Subtotal": subtotal,
      "VatId": vatId,
      "VatAmount": vatAmount,
      "TotalAmount": totalAmount,
      "groupId": groupId,
    };
  }
}
