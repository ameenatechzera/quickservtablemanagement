class FinishOrderParameter {
  final int? salesMasterId;
  final int? orderMasterId;
  final String? billStatus;
  final String? invoiceDate;
  final String? invoiceTime;
  final int? ledgerId;
  final double? subTotal;
  final double? discountAmount;
  final double? vatAmount;
  final double? grandTotal;
  final int? cashLedgerId;
  final double? cashAmount;
  final int? cardLedgerID;
  final double? cardAmount;
  final double? creditAmount;
  final double? totalTax;
  final String? salesType;
  final int? billTokenNo;
  final int? supplierId;
  final int? cashierId;
  final int? tableId;
  final int? branchId;
  final String? createdUser;
  final String? invoiceNoUpdate;
  final List<SalesDetail>? salesDetails;

  FinishOrderParameter({
    required this.salesMasterId,
    required this.orderMasterId,
    required this.billStatus,
    required this.invoiceDate,
    required this.invoiceTime,
    required this.ledgerId,
    required this.subTotal,
    required this.discountAmount,
    required this.vatAmount,
    required this.grandTotal,
    required this.cashLedgerId,
    required this.cashAmount,
    required this.cardLedgerID,
    required this.cardAmount,
    required this.creditAmount,
    required this.totalTax,
    required this.salesType,
    required this.billTokenNo,
    required this.supplierId,
    required this.cashierId,
    required this.tableId,
    required this.branchId,
    required this.createdUser,
    required this.invoiceNoUpdate,
    required this.salesDetails,
  });

  factory FinishOrderParameter.fromJson(Map<String, dynamic> json) {
    return FinishOrderParameter(
      salesMasterId: json['SalesMasterId'],
      orderMasterId: json['orderMasterId'],
      billStatus: json['BillStatus'],
      invoiceDate: json['InvoiceDate'],
      invoiceTime: json['InvoiceTime'],
      ledgerId: json['LedgerId'],
      subTotal: (json['SubTotal'] as num?)?.toDouble(),
      discountAmount: (json['DiscountAmount'] as num?)?.toDouble(),
      vatAmount: (json['VatAmount'] as num?)?.toDouble(),
      grandTotal: (json['GrandTotal'] as num?)?.toDouble(),
      cashLedgerId: json['CashLedgerId'],
      cashAmount: (json['CashAmount'] as num?)?.toDouble(),
      cardLedgerID: json['CardLedgerID'],
      cardAmount: (json['CardAmount'] as num?)?.toDouble(),
      creditAmount: (json['creditAmount'] as num?)?.toDouble(),
      totalTax: (json['totalTax'] as num?)?.toDouble(),
      salesType: json['salesType'],
      billTokenNo: json['billTokenNo'],
      supplierId: json['supplierId'],
      cashierId: json['cashierId'],
      tableId: json['table_id'],
      branchId: json['branchId'],
      createdUser: json['CreatedUser'],
      invoiceNoUpdate: json['invoiceNoUpdate'],
      salesDetails: (json['SalesDetails'] as List<dynamic>?)
          ?.map((e) => SalesDetail.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SalesMasterId': salesMasterId,
      'orderMasterId': orderMasterId,
      'BillStatus': billStatus,
      'InvoiceDate': invoiceDate,
      'InvoiceTime': invoiceTime,
      'LedgerId': ledgerId,
      'SubTotal': subTotal,
      'DiscountAmount': discountAmount,
      'VatAmount': vatAmount,
      'GrandTotal': grandTotal,
      'CashLedgerId': cashLedgerId,
      'CashAmount': cashAmount,
      'CardLedgerID': cardLedgerID,
      'CardAmount': cardAmount,
      'creditAmount': creditAmount,
      'totalTax': totalTax,
      'salesType': salesType,
      'billTokenNo': billTokenNo,
      'supplierId': supplierId,
      'cashierId': cashierId,
      'table_id': tableId,
      'branchId': branchId,
      'CreatedUser': createdUser,
      'invoiceNoUpdate': invoiceNoUpdate,
      'SalesDetails': salesDetails?.map((e) => e.toJson()).toList(),
    };
  }
}

class SalesDetail {
  final String? productCode;
  final String? productName;
  final int? qty;
  final int? unitId;
  final double? purchaseCost;
  final double? salesRate;
  final double? excludeRate;
  final double? subtotal;
  final int? vatId;
  final double? vatAmount;
  final double? totalAmount;
  final double? conversionRate;

  SalesDetail({
    this.productCode,
    this.productName,
    this.qty,
    this.unitId,
    this.purchaseCost,
    this.salesRate,
    this.excludeRate,
    this.subtotal,
    this.vatId,
    this.vatAmount,
    this.totalAmount,
    this.conversionRate,
  });

  factory SalesDetail.fromJson(Map<String, dynamic> json) {
    return SalesDetail(
      productCode: json['ProductCode'],
      productName: json['ProductName'],
      qty: json['Qty'],
      unitId: json['UnitId'],
      purchaseCost: (json['PurchaseCost'] as num?)?.toDouble(),
      salesRate: (json['SalesRate'] as num?)?.toDouble(),
      excludeRate: (json['ExcludeRate'] as num?)?.toDouble(),
      subtotal: (json['Subtotal'] as num?)?.toDouble(),
      vatId: json['VatId'],
      vatAmount: (json['VatAmount'] as num?)?.toDouble(),
      totalAmount: (json['TotalAmount'] as num?)?.toDouble(),
      conversionRate: (json['conversion_rate'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductCode': productCode,
      'ProductName': productName,
      'Qty': qty,
      'UnitId': unitId,
      'PurchaseCost': purchaseCost,
      'SalesRate': salesRate,
      'ExcludeRate': excludeRate,
      'Subtotal': subtotal,
      'VatId': vatId,
      'VatAmount': vatAmount,
      'TotalAmount': totalAmount,
      'conversion_rate': conversionRate,
    };
  }
}
