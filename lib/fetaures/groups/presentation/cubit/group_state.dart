part of 'group_cubit.dart';

sealed class GroupState extends Equatable {
  const GroupState();

  @override
  List<Object> get props => [];
}

final class GroupInitial extends GroupState {}

final class GroupsLoading extends GroupState {}

final class GroupsLoaded extends GroupState {
  final FetchGroupResponseModel groups;
  const GroupsLoaded({required this.groups});

  @override
  List<Object> get props => [groups];
}

final class GroupsError extends GroupState {
  final String error;
  const GroupsError({required this.error});

  @override
  List<Object> get props => [error];
}
