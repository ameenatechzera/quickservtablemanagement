import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/vat/data/models/fetch_vat_model.dart';

abstract class VatRepository {
  ResultFuture<FetchVatResponseModel> fetchVat();
}
