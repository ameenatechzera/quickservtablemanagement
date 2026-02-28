import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/models/fetch_settings_model.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/repositories/settings_repository.dart';

class FetchSettingsUseCase
    implements UseCaseWithoutParams<FetchSettingsResponseModel> {
  final SettingsRepository _settingsRepository;

  FetchSettingsUseCase(this._settingsRepository);

  @override
  ResultFuture<FetchSettingsResponseModel> call() async {
    return _settingsRepository.fetchSettings();
  }
}
