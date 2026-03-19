import 'package:quickservtablemanagement/core/models/master_api_response_model.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_orderdetails_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/fetch_ordermaster_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/finish_order_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/data/models/update_ordermasterwithtoken_model.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/cancel_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_orderdetails_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/finish_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/print_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/update_ordermasterwithtoken_parameter.dart';

abstract class OrderMasterRepository {
  ResultFuture<FetchOrderMasterModel> fetchOrderMaster(
    FetchOrderMasterParameter parameter,
  );
  ResultFuture<FinishOrderResponseModel> finishOrder(
    FinishOrderParameter parameter,
  );
  ResultFuture<ApiResponseModel> printVoucher(PrintParameter parameter);
  ResultFuture<UpdateOrderMasterWithTokenResponseModel>
  updateOrderMasterWithToken(UpdateOrderMasterWithTokenParameter parameter);
  ResultFuture<FetchOrderDetailsResponseModel> fetchOrderDetails(
    FetchOrderDetailsParameter parameter,
  );
  ResultFuture<ApiResponseModel> cancelOrder(CancelOrderParameter parameter);
}
