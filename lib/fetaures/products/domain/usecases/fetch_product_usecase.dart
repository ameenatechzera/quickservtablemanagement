import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/products/data/models/fetch_product_model.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/repositories/product_repository.dart';

class FetchProductsUseCase
    implements UseCaseWithoutParams<FetchProductResponseModel> {
  final ProductsRepository _productsRepository;

  FetchProductsUseCase(this._productsRepository);

  @override
  ResultFuture<FetchProductResponseModel> call() async {
    return _productsRepository.fetchProducts();
  }
}
