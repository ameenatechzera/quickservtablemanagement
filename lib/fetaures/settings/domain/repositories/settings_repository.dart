import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/models/fetch_settings_model.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/common_result_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/toke_update_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/token_details_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/parameters/update_token_parameter.dart';

abstract class SettingsRepository {
  ResultFuture<FetchSettingsResponseModel> fetchSettings();
  ResultFuture<CommonResult> refreshSalesToken();
  ResultFuture<TokenDetailsResult> fetchCurrentSalesTokenDetails();
  ResultFuture<TokenUpdateResult> updateSalesTokenToServer(
    UpdateSalesTokenRequest updateSalesTokenRequest,
  );
}
