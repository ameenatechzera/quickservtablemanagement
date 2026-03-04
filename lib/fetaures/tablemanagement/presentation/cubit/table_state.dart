part of 'table_cubit.dart';

abstract class TableState extends Equatable {
  const TableState();

  @override
  List<Object?> get props => [];
}

class TableInitial extends TableState {}

class TableLoading extends TableState {}

class TableLoaded extends TableState {
  final FetchTableResponseModel response;

  const TableLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class TableError extends TableState {
  final String message;

  const TableError(this.message);

  @override
  List<Object?> get props => [message];
}

class RunningTableLoading extends TableState {}

class RunningTableLoaded extends TableState {
  final FetchRunningTableResponseModel data;

  const RunningTableLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class RunningTableError extends TableState {
  final String message;

  const RunningTableError(this.message);

  @override
  List<Object?> get props => [message];
}

class AllTableLoading extends TableState {}

class AllTableLoaded extends TableState {
  final AllTablesResponseModel response;

  const AllTableLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class AllTableError extends TableState {
  final String message;

  const AllTableError(this.message);

  @override
  List<Object?> get props => [message];
}
