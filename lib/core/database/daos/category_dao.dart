import 'package:floor/floor.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/entities/fetch_category_entity.dart';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM tbl_category')
  Future<List<FetchCategoryDetailsEntity>> getAllCategories();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCategories(List<FetchCategoryDetailsEntity> categories);

  @Query('DELETE FROM tbl_category')
  Future<void> clearCategories();
}
