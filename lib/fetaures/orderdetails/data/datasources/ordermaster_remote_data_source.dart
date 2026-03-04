import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_ordermaster_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class OrderMasterRemoteDataSource {
  Future<FetchOrderMasterModel> fetchOrderMaster(
    FetchOrderMasterParameter parameter,
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
}
