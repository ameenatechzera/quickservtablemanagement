import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_alltable_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_table_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fetch_takeawayrunning_model.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/data/models/fethc_runningtable_model.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class TablesRemoteDataSource {
  Future<FetchTableResponseModel> fetchTables();
  Future<FetchRunningTableResponseModel> fetchRunningTables();
  Future<AllTablesResponseModel> fetchAllTables();
  Future<TakeawayOrderResponseModel> fetchTakeawayOrders();
}

class TablesRemoteDataSourceImpl implements TablesRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<FetchTableResponseModel> fetchTables() async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getTablesPath(baseUrl);

      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      print(dbName);
      print(token);
      if (token.isEmpty) {
        throw Exception("Token missing! Please login again.");
      }

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

      print("📌 fetchTables called");
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        return FetchTableResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      print("❌ Exception in fetchTables: $e");
      rethrow;
    }
  }

  /// ---------------- FETCH RUNNING TABLES ----------------
  @override
  Future<FetchRunningTableResponseModel> fetchRunningTables() async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getRunningTablesPath(baseUrl);

      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      print(dbName);
      print(token);

      if (token.isEmpty) {
        throw Exception("Token missing! Please login again.");
      }

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

      print("📌 fetchRunningTables called");
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        return FetchRunningTableResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      print("❌ Exception in fetchRunningTables: $e");
      rethrow;
    }
  }

  @override
  Future<AllTablesResponseModel> fetchAllTables() async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getAllTablesPath(baseUrl); // 🔥 create this

      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      print(dbName);
      print(token);

      if (token.isEmpty) {
        throw Exception("Token missing! Please login again.");
      }

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

      print("📌 fetchAllTables called");
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        return AllTablesResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      print("❌ Exception in fetchAllTables: $e");
      rethrow;
    }
  }

  @override
  Future<TakeawayOrderResponseModel> fetchTakeawayOrders() async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getTakeawayOrdersPath(baseUrl);

      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      print(dbName);
      print(token);

      if (token.isEmpty) {
        throw Exception("Token missing! Please login again.");
      }

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

      print("📌 fetchTakeawayOrders called");
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        return TakeawayOrderResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      print("❌ Exception in fetchTakeawayOrders: $e");
      rethrow;
    }
  }
}
