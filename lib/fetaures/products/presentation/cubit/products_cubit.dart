import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/products/data/models/fetch_product_model.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/entities/fetch_product_entity.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/repositories/product_local_repository.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/usecases/fetch_product_usecase.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/usecases/get_products_bycategory_usecase.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/usecases/get_products_bygroup_usecase.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  final FetchProductsUseCase fetchProductsUseCase;
  final ProductLocalRepository _productLocalRepository;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;
  final GetProductsByGroupUseCase _getProductsByGroupUseCase;

  ProductCubit({
    required this.fetchProductsUseCase,
    required ProductLocalRepository productLocalRepository,
    required GetProductsByCategoryUseCase getProductsByCategoryUseCase,
    required GetProductsByGroupUseCase getProductsByGroupUseCase,
  }) : _productLocalRepository = productLocalRepository,
       _getProductsByCategoryUseCase = getProductsByCategoryUseCase,
       _getProductsByGroupUseCase = getProductsByGroupUseCase,

       super(ProductsInitial());

  Future<void> fetchProducts() async {
    print("🔥 fetchProducts() CALLED");
    emit(ProductLoading());

    final response = await fetchProductsUseCase();

    print("🟡 fetchProductsUseCase returned: $response");

    response.fold(
      (failure) {
        print("❌ fetchProducts FAILURE: ${failure.message}");
        emit(ProductFailure(failure.message));
      },
      (productResponse) async {
        print("✅ fetchProducts SUCCESS: got response");

        final productsList = productResponse.productDetails ?? [];
        print("🧪 productsList length = ${productsList.length}");

        try {
          print("🧪 About to save ${productsList.length} products...");

          final missingCode = productsList
              .where((e) => (e.productCode ?? '').isEmpty)
              .length;
          print("🧪 Missing productCode count: $missingCode");

          final bigImgs = productsList
              .where((e) => (e.productImageByte?.length ?? 0) > 200000)
              .length;
          print("🧪 Big images (>200k chars) count: $bigImgs");

          await _productLocalRepository.saveProducts(productsList);

          print("✅ saveProducts completed without throwing");
          // ✅ IMPORTANT: emit local state so Sale/Home always shows
        } catch (e, st) {
          print("❌ saveProducts FAILED: $e");
          print(st);
        }

        emit(ProductSuccess(productResponse));
      },
    );
  }

  Future<void> clearProducts() async {
    print("🔥 fetchProducts() CALLED");

    await _productLocalRepository.clearProducts();
  }

  // --------------------- Fetch by Category (LOCAL DB) ---------------------
  Future<void> loadProductsByCategory(int categoryId) async {
    emit(ProductsByCategoryLoading());

    try {
      final products = await _getProductsByCategoryUseCase(categoryId);

      if (products.isEmpty) {
        emit(ProductsByCategoryEmpty());
      } else {
        emit(ProductsByCategoryLoaded(products: products));
      }
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  // --------------------- Fetch All Products from Local DB ---------------------
  Future<void> loadProductsFromLocal() async {
    emit(ProductLoadingFromLocal());

    try {
      final products = await _productLocalRepository.getProducts();

      if (products.isEmpty) {
        emit(ProductsEmptyFromLocal());
      } else {
        emit(ProductLoadedFromLocal(products));
      }
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  Future<void> loadProductsByGroup(int groupId) async {
    emit(ProductsByGroupLoading());

    try {
      final products = await _getProductsByGroupUseCase(groupId);

      if (products.isEmpty) {
        emit(ProductsByGroupEmpty());
      } else {
        emit(ProductsByGroupLoaded(products: products));
      }
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
