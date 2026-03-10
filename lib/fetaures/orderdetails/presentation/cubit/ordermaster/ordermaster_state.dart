part of 'ordermaster_cubit.dart';

abstract class OrderMasterState extends Equatable {
  const OrderMasterState();

  @override
  List<Object?> get props => [];
}

class OrderMasterInitial extends OrderMasterState {}

class OrderMasterLoading extends OrderMasterState {}

class OrderMasterLoaded extends OrderMasterState {
  final FetchOrderMasterModel order;

  const OrderMasterLoaded(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderMasterError extends OrderMasterState {
  final String message;

  const OrderMasterError(this.message);

  @override
  List<Object?> get props => [message];
}

// Finish Order States
class FinishOrderLoading extends OrderMasterState {}

class FinishOrderLoaded extends OrderMasterState {
  final FinishOrderResponseModel response;

  const FinishOrderLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class FinishOrderError extends OrderMasterState {
  final String message;
  const FinishOrderError(this.message);

  @override
  List<Object?> get props => [message];
}

/// ---------------- PRINT PDF ----------------

class PrintPdfLoading extends OrderMasterState {}

class PrintPdfLoaded extends OrderMasterState {
  final ApiResponseModel data;

  const PrintPdfLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class PrintPdfError extends OrderMasterState {
  final String message;

  const PrintPdfError(this.message);

  @override
  List<Object?> get props => [message];
}

class UpdateOrderMasterLoading extends OrderMasterState {}

class UpdateOrderMasterLoaded extends OrderMasterState {
  final UpdateOrderMasterWithTokenResponseModel response;

  const UpdateOrderMasterLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class UpdateOrderMasterError extends OrderMasterState {
  final String message;

  const UpdateOrderMasterError(this.message);

  @override
  List<Object?> get props => [message];
}
