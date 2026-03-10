import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_billdetails_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_billdetails_parameter.dart';

abstract class BillDetailsRepository {
  ResultFuture<FetchBillDetailsModel> fetchBillDetails(
    FetchBillDetailsParameter parameter,
  );
}
