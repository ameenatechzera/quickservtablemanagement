part of 'billdetails_cubit.dart';

abstract class BilldetailsState extends Equatable {
  const BilldetailsState();

  @override
  List<Object?> get props => [];
}

class BilldetailsInitial extends BilldetailsState {}

class BilldetailsLoading extends BilldetailsState {}

class BilldetailsLoaded extends BilldetailsState {
  final FetchBillDetailsEntity billDetails;

  const BilldetailsLoaded(this.billDetails);

  @override
  List<Object?> get props => [billDetails];
}

class BilldetailsError extends BilldetailsState {
  final String message;

  const BilldetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
