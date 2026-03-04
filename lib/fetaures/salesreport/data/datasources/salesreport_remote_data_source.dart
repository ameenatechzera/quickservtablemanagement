import 'package:dio/dio.dart';
import 'package:quickservtablemanagement/core/errors/error_message_model.dart';
import 'package:quickservtablemanagement/core/errors/exceptions.dart';
import 'package:quickservtablemanagement/core/network/api_endpoints.dart';
import 'package:quickservtablemanagement/fetaures/sale/domain/parameters/sales_details_request_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/data/models/salesdetails_bymasterid_model.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/data/models/salesreport_model.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/entities/masterresult.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/delete_salesparameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/sales_masterreport_bydate_parameter.dart';
import 'package:quickservtablemanagement/fetaures/salesreport/domain/parameters/salesreport_request_parameter.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

abstract class SalesReportRemoteDataSource {
  Future<SalesReportModel> fetchSalesReport(FetchReportRequest request);
  Future<SalesDetailsByMasterIdModel> fetchSalesDetailsByMasterId(
    FetchSalesDetailsRequest request,
  );
  Future<SalesReportModel> fetchSalesReportMasterByDate(
    SalesReportMasterByDateRequest request,
  );
  Future<MasterResult> deleteSalesFromServer(
    SalesDeleteByMasterIdRequest salesDeleteRequest,
  );
}

class SalesReportRemoteDataSourceImpl implements SalesReportRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<SalesReportModel> fetchSalesReport(FetchReportRequest request) async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getFetchSalesReportPath(
        baseUrl,
      ); // implement in ApiConstants
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      print('🔹 Save Sale URL: $url');
      print('🔹 DB Name: $dbName');
      print('🔹 Token exists: ${token.isNotEmpty}');

      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      final response = await dio.post(
        url,
        data: request.toJson(),
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
        return SalesReportModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, s) {
      print('❌ Exception in saveSale: $e');
      print(s);
      rethrow;
    }
  }

  @override
  Future<SalesDetailsByMasterIdModel> fetchSalesDetailsByMasterId(
    FetchSalesDetailsRequest request,
  ) async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getFetchSalesDetailsReportPath(
        baseUrl,
      ); // implement in ApiConstants
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      print('🔹 Save Sale URL: $url');
      print('🔹 DB Name: $dbName');
      print('🔹 Token exists: ${token.isNotEmpty}');

      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      final response = await dio.post(
        url,
        data: request.toJson(),
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
        return SalesDetailsByMasterIdModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, s) {
      print('❌ Exception in saveSale: $e');
      print(s);
      rethrow;
    }
  }

  @override
  Future<SalesReportModel> fetchSalesReportMasterByDate(
    SalesReportMasterByDateRequest request,
  ) async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.getFetchSalesReportPath(baseUrl);
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      print('🔹 Fetch Sales Report by Date URL: $url');
      print('🔹 DB Name: $dbName');
      print('🔹 Token exists: ${token.isNotEmpty}');
      print('🔹 Token : ${token}');

      if (token.isEmpty) throw Exception("Token missing! Please login again.");

      final response = await dio.post(
        url,
        data: request.toJson(),
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
        return SalesReportModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, s) {
      print('❌ Exception in fetchSalesReportMasterByDate: $e');
      print(s);
      rethrow;
    }
  }

  @override
  Future<MasterResult> deleteSalesFromServer(
    SalesDeleteByMasterIdRequest salesDeleteRequest,
  ) async {
    try {
      final baseUrl = await SharedPreferenceHelper().getBaseUrl();
      if (baseUrl == null || baseUrl.isEmpty) {
        throw Exception("Base URL not set");
      }

      final url = ApiConstants.deleteSalesByMasterIdPath(
        baseUrl,
        salesDeleteRequest.masterId,
      );
      final dbName = await SharedPreferenceHelper().getDatabaseName();
      final token = await SharedPreferenceHelper().getToken() ?? "";

      print('🔹 Fetch Sales Report by Date URL: $url');
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        return MasterResult.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } catch (e, s) {
      print('❌ Exception in fetchSalesReportMasterByDate: $e');
      print(s);
      rethrow;
    }
  }
}
