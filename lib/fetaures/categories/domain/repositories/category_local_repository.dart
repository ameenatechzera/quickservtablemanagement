import 'package:quickservtablemanagement/fetaures/categories/domain/entities/fetch_category_entity.dart';

abstract class CategoryLocalRepository {
  Future<void> saveCategories(List<FetchCategoryDetailsEntity> categories);
  Future<List<FetchCategoryDetailsEntity>> getCategories();
  Future<void> clearCategories();
}
