import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/models/fetch_settings_model.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/common_result_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/toke_update_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/token_details_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/parameters/update_token_parameter.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class SettingsRemoteDataSource {
  Future<FetchSettingsResponseModel> fetchSettings();
  Future<CommonResult> refreshSalesToken();
  Future<TokenDetailsResult> fetchCurrentSalesToken();
  Future<TokenUpdateResult> updateSalesTokenToServer(
    UpdateSalesTokenRequest updateSalesTokenRequest,
  );
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<FetchSettingsResponseModel> fetchSettings() async {
    try {
      // Get the base URL from shared preferences
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      // Build the full API URL
      final url = ApiConstants.getSettingsPath(baseUrl);
      print('🔹 Fetch Settings URL: $url');

      // Get database name and token
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      // Make GET request
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

      // Logging
      print('🔹 Status Code: ${response.statusCode}');
      print('🔹 ResponseSettings Data: ${response.data}');

      // Parse response
      if (response.statusCode == 200) {
        return FetchSettingsResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, stacktrace) {
      print('❌ Exception during fetchSettings: $e');
      print('Stacktrace: $stacktrace');
      rethrow;
    }
  }

  @override
  Future<CommonResult> refreshSalesToken() async {
    try {
      // Get the base URL from shared preferences
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      // Build the full API URL
      final url = ApiConstants.resetSalesTokenPath(baseUrl);
      print('🔹 Fetch Settings URL: $url');

      // Get database name and token
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      // Make GET request
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

      // Logging
      print('🔹 Status Code: ${response.statusCode}');
      print('🔹 Response Data: ${response.data}');

      // Parse response
      if (response.statusCode == 200) {
        return CommonResult.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, stacktrace) {
      print('❌ Exception during fetchSettings: $e');
      print('Stacktrace: $stacktrace');
      rethrow;
    }
  }

  @override
  Future<TokenDetailsResult> fetchCurrentSalesToken() async {
    // TODO: implement fetchCurrentSalesToken

    final dbName = await SharedPreferenceHelper().getDatabaseName();
    final token = await SharedPreferenceHelper().getToken() ?? "";
    // Get the base URL from shared preferences
    final baseUrl = await SharedPreferenceHelper().getBaseUrl();
    if (baseUrl == null || baseUrl.isEmpty) {
      throw Exception("Base URL not set");
    }

    // Build API URL
    String refreshTokenUrl = ApiConstants.fetchSalesTokenPath(baseUrl);
    print("refreshTokenUrl API URL: $refreshTokenUrl");

    try {
      final response = await dio.get(
        refreshTokenUrl,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print('🌐 Raw API Response: ${response.data}');
      print('🔢 Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        if (response.data == null) {
          throw Exception('Empty response from server');
        }

        // Convert API response to model
        return TokenDetailsResult.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      print("❌ Error  refreshTokenUrl : $e");
      throw Exception("Failed   refreshTokenUrl ");
    }
  }

  @override
  Future<TokenUpdateResult> updateSalesTokenToServer(
    UpdateSalesTokenRequest updateSalesTokenRequest,
  ) async {
    final dbName = await SharedPreferenceHelper().getDatabaseName();
    final token = await SharedPreferenceHelper().getToken() ?? "";
    // Get the base URL from shared preferences
    final baseUrl = await SharedPreferenceHelper().getBaseUrl();
    if (baseUrl == null || baseUrl.isEmpty) {
      throw Exception("Base URL not set");
    }

    // Build API URL
    String refreshTokenUrl = ApiConstants.updateSalesTokenPath(baseUrl);
    print("refreshTokenUrl API URL: $refreshTokenUrl");

    try {
      final response = await dio.post(
        refreshTokenUrl,
        data: updateSalesTokenRequest.toJson(),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print('🌐 Raw API Response: ${response.data}');
      print('🔢 Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        if (response.data == null) {
          throw Exception('Empty response from server');
        }

        // Convert API response to model
        return TokenUpdateResult.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e) {
      print("❌ Error  refreshTokenUrl : $e");
      throw Exception("Failed   refreshTokenUrl ");
    }
  }
}
