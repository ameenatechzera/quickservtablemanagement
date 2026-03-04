import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/domain/entities/fetch_alltable_entity.dart';

class AllTablesResponseModel extends Equatable {
  final int? status;
  final bool? error;
  final String? message;
  final Map<String, List<AllTableModel>>? tables;

  const AllTablesResponseModel({
    this.status,
    this.error,
    this.message,
    this.tables,
  });

  factory AllTablesResponseModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<AllTableModel>>? parsedTables;

    if (json['tables'] != null) {
      parsedTables = {};
      json['tables'].forEach((key, value) {
        parsedTables![key] = (value as List)
            .map((e) => AllTableModel.fromJson(e))
            .toList();
      });
    }

    return AllTablesResponseModel(
      status: json['status'] as int?,
      error: json['error'] as bool?,
      message: json['message'] as String?,
      tables: parsedTables,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'error': error,
      'message': message,
      'tables': tables?.map(
        (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
      ),
    };
  }

  AllTablesResponseEntity toEntity() {
    return AllTablesResponseEntity(
      status: status,
      error: error,
      message: message,
      tables: tables?.map(
        (key, value) => MapEntry(key, value.map((e) => e.toEntity()).toList()),
      ),
    );
  }

  @override
  List<Object?> get props => [status, error, message, tables];
}

class AllTableModel extends Equatable {
  final int? tableId;
  final String? tableNumber;
  final int? numberOfSeat;
  final int? status;
  final String? tableGroup;
  final int? branchId;
  final String? createdDate;
  final String? createdUser;
  final String? modifiedDate;
  final String? modifiedUser;
  final bool? isRunning;
  final int? orderMasterId;
  final String? orderNo;
  final String? amount;

  const AllTableModel({
    this.tableId,
    this.tableNumber,
    this.numberOfSeat,
    this.status,
    this.tableGroup,
    this.branchId,
    this.createdDate,
    this.createdUser,
    this.modifiedDate,
    this.modifiedUser,
    this.isRunning,
    this.orderMasterId,
    this.orderNo,
    this.amount,
  });

  factory AllTableModel.fromJson(Map<String, dynamic> json) {
    return AllTableModel(
      tableId: json['table_id'] as int?,
      tableNumber: json['table_number'] as String?,
      numberOfSeat: json['number_of_seat'] as int?,
      status: json['status'] as int?,
      tableGroup: json['table_group'] as String?,
      branchId: json['branchId'] as int?,
      createdDate: json['CreatedDate'] as String?,
      createdUser: json['CreatedUser']?.toString(),
      modifiedDate: json['ModifiedDate'] as String?,
      modifiedUser: json['ModifiedUser']?.toString(),
      isRunning: json['is_running'] as bool?,
      orderMasterId: json['OrderMasterId'] as int?,
      orderNo: json['OrderNo'] as String?,
      amount: json['Amount']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'table_id': tableId,
      'table_number': tableNumber,
      'number_of_seat': numberOfSeat,
      'status': status,
      'table_group': tableGroup,
      'branchId': branchId,
      'CreatedDate': createdDate,
      'CreatedUser': createdUser,
      'ModifiedDate': modifiedDate,
      'ModifiedUser': modifiedUser,
      'is_running': isRunning,
      'OrderMasterId': orderMasterId,
      'OrderNo': orderNo,
      'Amount': amount,
    };
  }

  AllTableEntity toEntity() {
    return AllTableEntity(
      tableId: tableId,
      tableNumber: tableNumber,
      numberOfSeat: numberOfSeat,
      status: status,
      tableGroup: tableGroup,
      branchId: branchId,
      createdDate: createdDate,
      createdUser: createdUser,
      modifiedDate: modifiedDate,
      modifiedUser: modifiedUser,
      isRunning: isRunning,
      orderMasterId: orderMasterId,
      orderNo: orderNo,
      amount: amount,
    );
  }

  @override
  List<Object?> get props => [
    tableId,
    tableNumber,
    numberOfSeat,
    status,
    tableGroup,
    branchId,
    createdDate,
    createdUser,
    modifiedDate,
    modifiedUser,
    isRunning,
    orderMasterId,
    orderNo,
    amount,
  ];
}
