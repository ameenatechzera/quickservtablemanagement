import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/models/fetch_category_model.dart';

abstract class CategoriesRepository {
  ResultFuture<FetchCategoryResponseModel> fetchCategories();
}
