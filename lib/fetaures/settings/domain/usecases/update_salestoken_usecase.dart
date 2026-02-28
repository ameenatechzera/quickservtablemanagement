import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/toke_update_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/parameters/update_token_parameter.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/repositories/settings_repository.dart';

class UpdateSalesTokenUseCase
    implements UseCaseWithParams<TokenUpdateResult, UpdateSalesTokenRequest> {
  final SettingsRepository _homeRepository;

  UpdateSalesTokenUseCase(this._homeRepository);

  @override
  ResultFuture<TokenUpdateResult> call(UpdateSalesTokenRequest request) async =>
      _homeRepository.updateSalesTokenToServer(request);
}
