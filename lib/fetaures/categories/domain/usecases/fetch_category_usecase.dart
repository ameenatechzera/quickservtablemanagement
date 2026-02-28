import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/models/fetch_category_model.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/repositories/category_repository.dart';

class FetchCategoriesUseCase
    implements UseCaseWithoutParams<FetchCategoryResponseModel> {
  final CategoriesRepository _categoriesRepository;

  FetchCategoriesUseCase(this._categoriesRepository);

  @override
  ResultFuture<FetchCategoryResponseModel> call() async {
    return _categoriesRepository.fetchCategories();
  }
}
