import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/vat/data/models/fetch_vat_model.dart';
import 'package:quickservtablemanagement/fetaures/vat/domain/repositories/vat_repository.dart';

class FetchVatUseCase implements UseCaseWithoutParams<FetchVatResponseModel> {
  final VatRepository _vatRepository;

  FetchVatUseCase(this._vatRepository);

  @override
  ResultFuture<FetchVatResponseModel> call() async {
    return _vatRepository.fetchVat();
  }
}
