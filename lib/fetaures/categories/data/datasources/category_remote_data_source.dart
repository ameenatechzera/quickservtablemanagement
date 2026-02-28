import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/categories/data/models/fetch_category_model.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class CategoriesRemoteDataSource {
  Future<FetchCategoryResponseModel> fetchCategories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<FetchCategoryResponseModel> fetchCategories() async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getCategoriesPath(baseUrl);
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      // debug prints (remove in production)
      print('🔹 Fetch Categories URL: $url');
      print('🔹 DB Name: $dbName');
      print('🔹 Token exists: ${token.isNotEmpty}');

      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      final response = await dio.get(
        url,
        options: Options(
          contentType: "application/json",
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print('🔹 Response status: ${response.statusCode}');
      print('🔹 Response data: ${response.data}');

      if (response.statusCode == 200) {
        return FetchCategoryResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, s) {
      print('❌ Exception in fetchCategories: $e');
      print(s);
      rethrow;
    }
  }
}
