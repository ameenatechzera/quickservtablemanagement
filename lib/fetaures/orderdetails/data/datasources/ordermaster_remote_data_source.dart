import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/models/master_api_response_model.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_ordermaster_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/finish_order_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/update_ordermasterwithtoken_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/finish_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/print_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/update_ordermasterwithtoken_parameter.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class OrderMasterRemoteDataSource {
  Future<FetchOrderMasterModel> fetchOrderMaster(
    FetchOrderMasterParameter parameter,
  );
  Future<FinishOrderResponseModel> finishOrder(FinishOrderParameter parameter);
  Future<ApiResponseModel> printVoucher(PrintParameter parameter);
  Future<UpdateOrderMasterWithTokenResponseModel> updateOrderMasterWithToken(
    UpdateOrderMasterWithTokenParameter parameter,
  );
}

class OrderMasterRemoteDataSourceImpl implements OrderMasterRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<FetchOrderMasterModel> fetchOrderMaster(
    FetchOrderMasterParameter parameter,
  ) async {
    try {
      // 🔹 Get base URL
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      // 🔹 Build API URL
      final url = ApiConstants.getfetchOrderMasterPath(baseUrl);
      print("🔹 Fetch OrderMaster URL: $url");

      // 🔹 Get headers data
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      if (token.isEmpty) {
        throw Exception("Token missing! Please login again.");
      }

      // 🔹 Make POST request
      final response = await dio.post(
        url,
        data: parameter.toJson(),
        options: Options(
          contentType: "application/json",
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Response Data: ${response.data}");

      if (response.statusCode == 200) {
        return FetchOrderMasterModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, stacktrace) {
      print("❌ Exception during fetchOrderMaster: $e");
      print("Stacktrace: $stacktrace");
      rethrow;
    }
  }

  @override
  Future<FinishOrderResponseModel> finishOrder(
    FinishOrderParameter parameter,
  ) async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getFinishOrderPath(baseUrl);
      print("🔹 Finish Order URL: $url");

      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      if (token.isEmpty) {
        throw Exception("Token missing! Please login again.");
      }
      final body = parameter.toJson();
      print(body);
      final response = await dio.post(
        url,
        data: parameter.toJson(),
        options: Options(
          contentType: "application/json",
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Response Data: ${response.data}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        return FinishOrderResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, stacktrace) {
      print("❌ Exception during finishOrder: $e");
      print("Stacktrace: $stacktrace");
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel> printVoucher(PrintParameter parameter) async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getWindowsPrintpdfPath(baseUrl);
      print("🔹 Print Voucher URL: $url");

      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      if (token.isEmpty) {
        throw Exception("Token missing! Please login again.");
      }

      final body = parameter.toJson();
      print("🔹 Request Body: $body");

      final response = await dio.post(
        url,
        data: body,
        options: Options(
          contentType: "application/json",
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponseModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, stacktrace) {
      print("❌ Exception during printVoucher: $e");
      print("Stacktrace: $stacktrace");
      rethrow;
    }
  }

  //   @override
  //   Future<UpdateOrderMasterWithTokenResponseModel> updateOrderMasterWithToken(
  //     UpdateOrderMasterWithTokenParameter parameter,
  //   ) async {
  //     try {
  //       final baseUrl = await SharedPreferenceHelper().getBaseUrl();

  //       if (baseUrl == null || baseUrl.isEmpty) {
  //         throw Exception("Base URL not set");
  //       }

  //       final url = ApiConstants.getUpdateOrderMasterWithTokenPath(baseUrl);
  //       print("🔹 Update OrderMaster With Token URL: $url");

  //       final dbName = await SharedPreferenceHelper().getDatabaseName();
  //       final token = await SharedPreferenceHelper().getToken() ?? "";

  //       if (token.isEmpty) {
  //         throw Exception("Token missing! Please login again.");
  //       }

  //       final body = parameter.toJson();
  //       print("🔹 Request Body: $body");

  //       final response = await dio.post(
  //         url,
  //         data: body,
  //         options: Options(
  //           contentType: "application/json",
  //           headers: {
  //             "Accept": "application/json",
  //             "Authorization": "Bearer $token",
  //             "X-Database-Name": dbName,
  //           },
  //         ),
  //       );

  //       print("🔹 Status Code: ${response.statusCode}");
  //       print("🔹 Response Data: ${response.data}");

  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         return UpdateOrderMasterWithTokenResponseModel.fromJson(response.data);
  //       } else {
  //         throw ServerException(
  //           errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //         );
  //       }
  //     } catch (e, stacktrace) {
  //       print("❌ Exception during updateOrderMasterWithToken: $e");
  //       print("Stacktrace: $stacktrace");
  //       rethrow;
  //     }
  //   }
  // }

  @override
  Future<UpdateOrderMasterWithTokenResponseModel> updateOrderMasterWithToken(
    UpdateOrderMasterWithTokenParameter parameter,
  ) async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();

      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("❌ Base URL not set");
      }

      final url = ApiConstants.getUpdateOrderMasterWithTokenPath(baseUrl);
      print("🌐 API URL: $url");

      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      print("🔑 Token: $token");
      print("🗄 Database Name: $dbName");

      if (token.isEmpty) {
        throw Exception("❌ Token missing! Please login again.");
      }

      final body = parameter.toJson();

      print("📦 Request Body (RAW): $body");
      print("📦 Request Body (JSON): ${jsonEncode(body)}");

      final response = await dio.post(
        url,
        data: body,
        options: Options(
          contentType: "application/json",
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print("✅ Status Code: ${response.statusCode}");
      print("✅ Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UpdateOrderMasterWithTokenResponseModel.fromJson(response.data);
      } else {
        print("❌ Unexpected Status Code: ${response.statusCode}");
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioException catch (e) {
      print("🚨 DIO ERROR OCCURRED");

      print("🔴 Status Code: ${e.response?.statusCode}");
      print("🔴 Response Data: ${e.response?.data}");
      print("🔴 Error Message: ${e.message}");

      throw Exception(e.response?.data ?? e.message);
    } catch (e, stacktrace) {
      print("❌ General Exception: $e");
      print("📍 Stacktrace: $stacktrace");
      rethrow;
    }
  }
}
