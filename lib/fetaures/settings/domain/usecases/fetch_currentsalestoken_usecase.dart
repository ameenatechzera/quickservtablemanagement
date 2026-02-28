import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/token_details_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/repositories/settings_repository.dart';

class FetchCurrentSalesTokenUseCase
    implements UseCaseWithoutParams<TokenDetailsResult> {
  final SettingsRepository _generalRepository;

  FetchCurrentSalesTokenUseCase(this._generalRepository);

  @override
  ResultFuture<TokenDetailsResult> call() async =>
      _generalRepository.fetchCurrentSalesTokenDetails();
}
