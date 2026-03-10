import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_billdetails_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_billdetails_parameter.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class BillDetailsRemoteDataSource {
  Future<FetchBillDetailsModel> fetchBillDetails(
    FetchBillDetailsParameter params,
  );
}

class BillDetailsRemoteDataSourceImpl implements BillDetailsRemoteDataSource {
  final Dio dio = Dio();

  // BillDetailsRemoteDataSourceImpl({required this.dio});

  @override
  Future<FetchBillDetailsModel> fetchBillDetails(
    FetchBillDetailsParameter params,
  ) async {
    try {
      // Get base URL
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      // Build API URL
      final url = ApiConstants.getBillDetailsPath(baseUrl);
      print('🔹 Fetch Bill Details URL: $url');

      // Get database name and token
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";
      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      // POST request
      final response = await dio.post(
        url,
        data: params.toJson(),
        options: Options(
          contentType: "application/json",
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "X-Database-Name": dbName,
          },
        ),
      );

      print('🔹 Status Code: ${response.statusCode}');
      print('🔹 Response Data: ${response.data}');

      if (response.statusCode == 200) {
        return FetchBillDetailsModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, stacktrace) {
      print('❌ Exception during fetchBillDetails: $e');
      print('Stacktrace: $stacktrace');
      rethrow;
    }
  }
}
