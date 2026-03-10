class PrintParameter {
  final String voucherType;
  final int masterId;
  final int noOfCopies;
  final String printerName;
  final bool printStatus;
  final String createdUser;
  final int branchId;

  PrintParameter({
    required this.voucherType,
    required this.masterId,
    required this.noOfCopies,
    required this.printerName,
    required this.printStatus,
    required this.createdUser,
    required this.branchId,
  });

  Map<String, dynamic> toJson() {
    return {
      "voucherType": voucherType,
      "masterId": masterId,
      "noOfCopies": noOfCopies,
      "printerName": printerName,
      "printStatus": printStatus,
      "CreatedUser": createdUser,
      "branchId": branchId,
    };
  }
}
