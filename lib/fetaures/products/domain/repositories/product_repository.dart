import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/products/data/models/fetch_product_model.dart';

abstract class ProductsRepository {
  ResultFuture<FetchProductResponseModel> fetchProducts();
}
