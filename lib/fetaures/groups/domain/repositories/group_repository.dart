import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/groups/data/models/fetch_group_model.dart';

abstract class GroupsRepository {
  ResultFuture<FetchGroupResponseModel> fetchGroups();
}
