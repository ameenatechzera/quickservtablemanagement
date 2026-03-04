class OrderSaveParameter {
  String orderDate;
  String orderTime;
  int ledgerId;
  double subTotal;
  double discountAmount;
  double vatAmount;
  double grandTotal;
  int cashLedgerId;
  double cashAmount;
  int? cardLedgerID;
  double cardAmount;
  double creditAmount;
  String billStatus;
  int tableId;
  int userId;
  int mergeStatus;
  int? mergeId;
  String orderType;
  int branchId;
  String createdUser;
  String customerName;
  dynamic address; // Can be int or string based on your data
  String phoneNo;
  int seatsUsed;
  String remarks;
  int? salesMasterId;
  List<OrderDetail> orderDetails;

  OrderSaveParameter({
    required this.orderDate,
    required this.orderTime,
    required this.ledgerId,
    required this.subTotal,
    required this.discountAmount,
    required this.vatAmount,
    required this.grandTotal,
    required this.cashLedgerId,
    required this.cashAmount,
    this.cardLedgerID,
    required this.cardAmount,
    required this.creditAmount,
    required this.billStatus,
    required this.tableId,
    required this.userId,
    required this.mergeStatus,
    this.mergeId,
    required this.orderType,
    required this.branchId,
    required this.createdUser,
    required this.customerName,
    this.address,
    required this.phoneNo,
    required this.seatsUsed,
    required this.remarks,
    this.salesMasterId,
    required this.orderDetails,
  });

  factory OrderSaveParameter.fromJson(Map<String, dynamic> json) =>
      OrderSaveParameter(
        orderDate: json['OrderDate'],
        orderTime: json['OrderTime'],
        ledgerId: json['LedgerId'],
        subTotal: (json['SubTotal'] as num).toDouble(),
        discountAmount: (json['DiscountAmount'] as num).toDouble(),
        vatAmount: (json['VatAmount'] as num).toDouble(),
        grandTotal: (json['GrandTotal'] as num).toDouble(),
        cashLedgerId: json['CashLedgerId'],
        cashAmount: (json['CashAmount'] as num).toDouble(),
        cardLedgerID: json['CardLedgerID'],
        cardAmount: (json['CardAmount'] as num).toDouble(),
        creditAmount: (json['creditAmount'] as num).toDouble(),
        billStatus: json['BillStatus'],
        tableId: json['table_id'],
        userId: json['userId'],
        mergeStatus: json['mergeStatus'],
        mergeId: json['mergeId'],
        orderType: json['orderType'],
        branchId: json['branchId'],
        createdUser: json['CreatedUser'],
        customerName: json['customerName'],
        address: json['address'],
        phoneNo: json['phoneNo'],
        seatsUsed: json['seatsUsed'],
        remarks: json['remarks'],
        salesMasterId: json['salesMasterId'],
        orderDetails: (json['orderDetails'] as List)
            .map((e) => OrderDetail.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    'OrderDate': orderDate,
    'OrderTime': orderTime,
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
    'BillStatus': billStatus,
    'table_id': tableId,
    'userId': userId,
    'mergeStatus': mergeStatus,
    'mergeId': mergeId,
    'orderType': orderType,
    'branchId': branchId,
    'CreatedUser': createdUser,
    'customerName': customerName,
    'address': address,
    'phoneNo': phoneNo,
    'seatsUsed': seatsUsed,
    'remarks': remarks,
    'salesMasterId': salesMasterId,
    'orderDetails': orderDetails.map((e) => e.toJson()).toList(),
  };
}

class OrderDetail {
  String productCode;
  String productName;
  String productDescription;
  int qty;
  int unitId;
  double purchaseCost;
  double salesRate;
  double excludeRate;
  double subtotal;
  int vatId;
  double vatAmount;
  double totalAmount;
  int groupId;

  OrderDetail({
    required this.productCode,
    required this.productName,
    required this.productDescription,
    required this.qty,
    required this.unitId,
    required this.purchaseCost,
    required this.salesRate,
    required this.excludeRate,
    required this.subtotal,
    required this.vatId,
    required this.vatAmount,
    required this.totalAmount,
    required this.groupId,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    productCode: json['ProductCode'],
    productName: json['ProductName'],
    productDescription: json['Product_description'],
    qty: json['Qty'],
    unitId: json['UnitId'],
    purchaseCost: (json['PurchaseCost'] as num).toDouble(),
    salesRate: (json['SalesRate'] as num).toDouble(),
    excludeRate: (json['ExcludeRate'] as num).toDouble(),
    subtotal: (json['Subtotal'] as num).toDouble(),
    vatId: json['VatId'],
    vatAmount: (json['VatAmount'] as num).toDouble(),
    totalAmount: (json['TotalAmount'] as num).toDouble(),
    groupId: json['groupId'],
  );

  Map<String, dynamic> toJson() => {
    'ProductCode': productCode,
    'ProductName': productName,
    'Product_description': productDescription,
    'Qty': qty,
    'UnitId': unitId,
    'PurchaseCost': purchaseCost,
    'SalesRate': salesRate,
    'ExcludeRate': excludeRate,
    'Subtotal': subtotal,
    'VatId': vatId,
    'VatAmount': vatAmount,
    'TotalAmount': totalAmount,
    'groupId': groupId,
  };
}
