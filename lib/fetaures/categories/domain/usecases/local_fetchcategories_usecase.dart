import 'package:quickservtablemanagement/fetaures/categories/domain/entities/fetch_category_entity.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/repositories/category_local_repository.dart';

class GetLocalCategoriesUseCase {
  final CategoryLocalRepository repository;

  GetLocalCategoriesUseCase(this.repository);

  Future<List<FetchCategoryDetailsEntity>> call() async {
    return repository.getCategories();
  }
}
