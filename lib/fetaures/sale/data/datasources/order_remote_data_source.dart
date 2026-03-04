import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/sale/data/models/order_save_model.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/order_save_parameter.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class OrdersRemoteDataSource {
  Future<CreateOrderResponseModel> saveOrder(OrderSaveParameter request);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<CreateOrderResponseModel> saveOrder(OrderSaveParameter request) async {
    try {
      // Get base URL
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      // Build API URL
      final url = ApiConstants.getSaveOrderPath(
        baseUrl,
      ); // implement in ApiConstants
      print("🔥 BASE URL FROM STORAGE => $baseUrl");
      print("🔥 GENERATED URL => $url");
      // Get DB name & Token
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      print('🔹 Save Order URL: $url');
      print('🔹 DB Name: $dbName');
      print('🔹 Token exists: ${token.isNotEmpty}');
      print('🔹 Token: $token');

      // 🔹 PRINT REQUEST BODY
      final requestBody = request.toJson();
      print('📤 Save Order Request Body: $requestBody');
      print(const JsonEncoder.withIndent('  ').convert(requestBody));

      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      // Make POST request
      final response = await dio.post(
        url,
        data: requestBody,
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CreateOrderResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, s) {
      print('❌ Exception in saveOrder: $e');
      print(s);
      rethrow;
    }
  }
}
