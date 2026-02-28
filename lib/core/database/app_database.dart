import 'dart:async';
import 'package:floor/floor.dart';
import 'package:quickservtablemanagement/core/database/daos/product_dao.dart';
import 'package:quickservtablemanagement/fetaures/categories/domain/entities/fetch_category_entity.dart';
import 'package:quickservtablemanagement/fetaures/products/domain/entities/fetch_product_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'daos/category_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [FetchCategoryDetailsEntity, FetchProductDetails],
)
abstract class AppDatabase extends FloorDatabase {
  CategoryDao get categoryDao;
  ProductDao get productDao;
}
