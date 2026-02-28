import 'package:get_it/get_it.dart';
import 'package:quickservtablemanagement/core/database/app_database.dart';
import 'package:quickservtablemanagement/fetaures/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/authentication/data/repositories/auth_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/repositories/auth_repository.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/usecases/login_usecase.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/usecases/register_server_usecase.dart';
import 'package:quickservtablemanagement/fetaures/authentication/presentation/cubit/logincubit/login_cubit.dart';
import 'package:quickservtablemanagement/fetaures/authentication/presentation/cubit/registercubit/register_cubit.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/datasources/category_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/repositories/category_local_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/repositories/category_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/repositories/category_local_repository.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/repositories/category_repository.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/usecases/fetch_category_usecase.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/usecases/local_fetchcategories_usecase.dart';
import 'package:quickservtablemanagement/fetaures/categories/presentation/cubit/categories_cubit.dart';
import 'package:quickservtablemanagement/fetaures/groups/data/datasources/group_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/groups/data/repositories/group_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/groups/domain/repositories/group_repository.dart';
import 'package:quickservtablemanagement/fetaures/groups/domain/usecases/fetch_group_usecase.dart';
import 'package:quickservtablemanagement/fetaures/groups/presentation/cubit/group_cubit.dart';
import 'package:quickservtablemanagement/fetaures/products/data/datasources/product_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/products/data/repositories/product_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/products/data/repositories/product_repository_local_impl.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/repositories/product_local_repository.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/repositories/product_repository.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/usecases/fetch_product_usecase.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/usecases/get_products_bycategory_usecase.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/usecases/get_products_bygroup_usecase.dart';
import 'package:quickservtablemanagement/fetaures/products/presentation/cubit/products_cubit.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/usecases/save_sale_usecase.dart';
import 'package:quickservtablemanagement/fetaures/sale/presentation/cubit/sale_cubit.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/datasources/settings_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/repositories/settings_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/repositories/settings_repository.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/usecases/fetch_currentsalestoken_usecase.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/usecases/fetch_settings_usecase.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/usecases/update_salestoken_usecase.dart';
import 'package:quickservtablemanagement/fetaures/settings/presentation/cubit/settings_cubit.dart';
import 'package:quickservtablemanagement/fetaures/unit/data/datasources/units_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/unit/data/repositories/unit_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/unit/domain/repositories/units_repository.dart';
import 'package:quickservtablemanagement/fetaures/unit/domain/usecases/fetch_units_usecase.dart';
import 'package:quickservtablemanagement/fetaures/unit/presentation/cubit/unit_cubit.dart';
import 'package:quickservtablemanagement/fetaures/vat/data/datasources/vat_remote_data_source.dart';
import 'package:quickservtablemanagement/fetaures/vat/data/repositories/vat_repository_impl.dart';
import 'package:quickservtablemanagement/fetaures/vat/domain/repositories/vat_repository.dart';
import 'package:quickservtablemanagement/fetaures/vat/domain/usecases/fetch_vat_usecase.dart';
import 'package:quickservtablemanagement/fetaures/vat/presentation/cubit/vat_cubit.dart';
import 'package:quickservtablemanagement/main.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    // ------------------- AUTH -------------------
    //  Cubit
    sl.registerFactory(() => RegisterCubit(registerServerUseCase: sl()));
    sl.registerFactory(() => LoginCubit(loginServerUseCase: sl()));
    // usecase
    sl.registerLazySingleton(() => RegisterServerUseCase(sl()));
    sl.registerLazySingleton(() => LoginServerUseCase(sl()));
    // sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    );

    // repository
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl()),
    );

    // ------------------- UNITS -------------------
    // Cubit
    sl.registerFactory(() => UnitCubit(fetchUnitsUseCase: sl()));

    // UseCase
    sl.registerLazySingleton(() => FetchUnitsUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<UnitsRemoteDataSource>(
      () => UnitsRemoteDataSourceImpl(),
    );

    // Repository
    sl.registerLazySingleton<UnitsRepository>(
      () => UnitsRepositoryImpl(remoteDataSource: sl()),
    );

    // ------------------- VAT -------------------
    // Cubit
    sl.registerFactory(() => VatCubit(fetchVatUseCase: sl()));
    // UseCase
    sl.registerLazySingleton(() => FetchVatUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<VatRemoteDataSource>(
      () => VatRemoteDataSourceImpl(),
    );
    // Repository
    sl.registerLazySingleton<VatRepository>(
      () => VatRepositoryImpl(remoteDataSource: sl()),
    );

    // ------------------- GROUPS -------------------
    // Cubit
    sl.registerFactory(() => GroupsCubit(fetchGroupsUseCase: sl()));
    // UseCase
    sl.registerLazySingleton(() => FetchGroupsUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<GroupsRemoteDataSource>(
      () => GroupsRemoteDataSourceImpl(),
    );
    // Repository
    sl.registerLazySingleton<GroupsRepository>(
      () => GroupsRepositoryImpl(remoteDataSource: sl()),
    );

    // ------------------- PRODUCTS -------------------
    // Cubit
    sl.registerFactory(
      () => ProductCubit(
        fetchProductsUseCase: sl(),
        productLocalRepository: sl(),
        getProductsByCategoryUseCase: sl(),
        getProductsByGroupUseCase: sl(),
      ),
    );
    sl.registerLazySingleton(() => GetProductsByGroupUseCase(sl()));

    // // ------------------- Sales Report -------------------

    // // Cubit
    // sl.registerFactory(
    //   () => SalesReportCubit(
    //     salesReportFromServerUseCase: sl(),
    //     salesDetailsByMasterIdUseCase: sl(),
    //     salesReportMasterByDateUseCase: sl(),
    //     deleteSalesFromServerUseCase: sl(),
    //   ),
    // );
    // // UseCase
    // sl.registerLazySingleton(() => SalesReportFromServerUseCase(sl()));
    // sl.registerLazySingleton(() => SalesDetailsByMasterIdUseCase(sl()));
    // sl.registerLazySingleton(() => SalesReportMasterByDateUseCase(sl()));
    // sl.registerLazySingleton(() => DeleteSalesFromServerUseCase(sl()));

    // // Data Source
    // sl.registerLazySingleton<SalesReportRemoteDataSource>(
    //   () => SalesReportRemoteDataSourceImpl(),
    // );
    // // Repository
    // sl.registerLazySingleton<SalesReportRepository>(
    //   () => SalesReportRepositoryImpl(remoteDataSource: sl()),
    // );

    // UseCase
    sl.registerLazySingleton(() => FetchProductsUseCase(sl()));
    sl.registerLazySingleton(() => GetProductsByCategoryUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(),
    );
    sl.registerLazySingleton<ProductLocalRepository>(
      () => ProductLocalRepositoryImpl(sl()), // <-- Inject Floor DAO here
    );
    // Repository
    sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(remoteDataSource: sl()),
    );

    // ------------------- SETTINGS -------------------
    // Cubit
    sl.registerFactory(
      () => SettingsCubit(
        fetchSettingsUseCase: sl(),
        fetchCurrentSalesTokenUseCase: sl(),
        updateSalesTokenUseCase: sl(),
      ),
    );
    // UseCase
    sl.registerLazySingleton(() => FetchSettingsUseCase(sl()));
    sl.registerLazySingleton(() => FetchCurrentSalesTokenUseCase(sl()));
    sl.registerLazySingleton(() => UpdateSalesTokenUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<SettingsRemoteDataSource>(
      () => SettingsRemoteDataSourceImpl(),
    );
    // Repository
    sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(remoteDataSource: sl()),
    );

    // ------------------- CATEGORIES -------------------
    // Floor Database
    sl.registerLazySingleton<AppDatabase>(() => appDb);

    // Cubit
    sl.registerFactory(
      () => CategoriesCubit(
        fetchCategoriesUseCase: sl(),
        categoryLocalRepository: sl(),

        getLocalCategoriesUseCase: sl(),
      ),
    );
    // UseCase
    sl.registerLazySingleton(() => FetchCategoriesUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(),
    );
    // Repository
    sl.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(remoteDataSource: sl()),
    );
    sl.registerLazySingleton<CategoryLocalRepository>(
      () => CategoryLocalRepositoryImpl(sl()),
    );
    sl.registerLazySingleton(() => GetLocalCategoriesUseCase(sl()));
    //   // ------------------- SALES -------------------
    //   sl.registerFactory(
    //     () => SaleCubit(
    //       saveSaleUseCase: sl(),
    //       salesRepository: sl(),
    //       // salesDetailsByMasterIdUseCase: sl(),
    //     ),
    //   );
    //   sl.registerLazySingleton(() => SaveSaleUseCase(sl()));
    //   sl.registerLazySingleton<SalesRemoteDataSource>(
    //     () => SalesRemoteDataSourceImpl(),
    //   );
    //   sl.registerLazySingleton<SalesRepository>(
    //     () => SalesRepositoryImpl(remoteDataSource: sl()),
    //   );
    // }
  }
}
