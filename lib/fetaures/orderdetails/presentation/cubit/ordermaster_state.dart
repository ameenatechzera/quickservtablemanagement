part of 'ordermaster_cubit.dart';

abstract class OrderMasterState extends Equatable {
  const OrderMasterState();

  @override
  List<Object?> get props => [];
}

class OrderMasterInitial extends OrderMasterState {}

class OrderMasterLoading extends OrderMasterState {}

class OrderMasterLoaded extends OrderMasterState {
  final FetchOrderMasterEntity order;

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
