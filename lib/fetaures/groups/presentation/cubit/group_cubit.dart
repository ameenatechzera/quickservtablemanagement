import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/groups/data/models/fetch_group_model.dart';
import 'package:quickservtablemanagement/fetaures/groups/domain/usecases/fetch_group_usecase.dart';

part 'group_state.dart';

class GroupsCubit extends Cubit<GroupState> {
  final FetchGroupsUseCase _fetchGroupsUseCase;
  GroupsCubit({required FetchGroupsUseCase fetchGroupsUseCase})
    : _fetchGroupsUseCase = fetchGroupsUseCase,
      super(GroupInitial());

  Future<void> fetchGroups() async {
    emit(GroupsLoading());

    final response = await _fetchGroupsUseCase();

    response.fold(
      (failure) => emit(GroupsError(error: failure.message)),
      (response) => emit(GroupsLoaded(groups: response)),
    );
  }
}
