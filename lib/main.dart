import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickservtablemanagement/core/database/app_database.dart';
import 'package:quickservtablemanagement/fetaures/authentication/presentation/cubit/logincubit/login_cubit.dart';
import 'package:quickservtablemanagement/fetaures/authentication/presentation/cubit/registercubit/register_cubit.dart';
import 'package:quickservtablemanagement/fetaures/authentication/presentation/screens/splash_screen.dart';
import 'package:quickservtablemanagement/fetaures/categories/presentation/cubit/categories_cubit.dart';
import 'package:quickservtablemanagement/fetaures/groups/presentation/cubit/group_cubit.dart';
import 'package:quickservtablemanagement/fetaures/products/presentation/cubit/products_cubit.dart';
import 'package:quickservtablemanagement/fetaures/sale/presentation/cubit/sale_cubit.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/presentation/cubit/salereport_cubit.dart';
import 'package:quickservtablemanagement/fetaures/settings/presentation/cubit/settings_cubit.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/presentation/cubit/table_cubit.dart';
import 'package:quickservtablemanagement/fetaures/unit/presentation/cubit/unit_cubit.dart';
import 'package:quickservtablemanagement/fetaures/vat/presentation/cubit/vat_cubit.dart';
import 'package:quickservtablemanagement/services/service_locator.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

late final AppDatabase appDb;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: AppColors.theme,
  //     statusBarIconBrightness: Brightness.dark,
  //     //statusBarBrightness: Brightness.dark,
  //   ),
  // );
  appDb = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  await ServiceLocator.init();
  final sharedPrefHelper = SharedPreferenceHelper();

  // set the default URL if not already set
  final currentBaseUrl = await sharedPrefHelper.getBaseUrl();
  if (currentBaseUrl == null) {
    await sharedPrefHelper.setBaseUrl(
      'https://techzera.in/quikSERV_Api/public/api',
    );
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(create: (_) => sl<RegisterCubit>()),
        BlocProvider<LoginCubit>(create: (_) => sl<LoginCubit>()),
        BlocProvider<UnitCubit>(create: (_) => sl<UnitCubit>()..fetchUnits()),
        BlocProvider<VatCubit>(create: (_) => sl<VatCubit>()..fetchVat()),
        BlocProvider<GroupsCubit>(
          create: (_) => sl<GroupsCubit>()..fetchGroups(),
        ),
        BlocProvider<ProductCubit>(create: (_) => sl<ProductCubit>()),
        BlocProvider<SettingsCubit>(create: (_) => sl<SettingsCubit>()),
        BlocProvider<CategoriesCubit>(create: (_) => sl<CategoriesCubit>()),
        BlocProvider<SaleCubit>(create: (_) => sl<SaleCubit>()),
        BlocProvider<SalesReportCubit>(create: (_) => sl<SalesReportCubit>()),
        BlocProvider<TableCubit>(create: (_) => sl<TableCubit>()),

        // BlocProvider<UserCreationCubit>(create: (_) => sl<UserCreationCubit>()),
        // BlocProvider<AccountledgerCubit>(
        //   create: (_) => sl<AccountledgerCubit>(),
        // ),
        // BlocProvider<ItemWiseReportCubit>(
        //   create: (_) => sl<ItemWiseReportCubit>(),
        // ),
        // BlocProvider<DaycloseReportCubit>(
        //   create: (_) => sl<DaycloseReportCubit>(),
        // ),
        // BlocProvider<AccountGroupCubit>(create: (_) => sl<AccountGroupCubit>()),
        // BlocProvider<PaymentCubit>(create: (_) => sl<PaymentCubit>()),
        // BlocProvider<ItemCubit>(create: (_) => sl<ItemCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QuikSERVTableManagement',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
            // systemOverlayStyle: SystemUiOverlayStyle(
            //   statusBarColor: AppColors.theme,
            //   statusBarIconBrightness: Brightness.dark,
            //   statusBarBrightness: Brightness.light,
            // ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
