import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/entities/register_server_entity.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/parameters/register_server_params.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/repositories/auth_repository.dart';

class RegisterServerUseCase
    implements
        UseCaseWithParams<RegisterResponseResult, RegisterServerRequest> {
  final AuthRepository _authRepository;

  RegisterServerUseCase(this._authRepository);

  @override
  ResultFuture<RegisterResponseResult> call(
    RegisterServerRequest registerResponseResult,
  ) async => _authRepository.registerServer(registerResponseResult);
}
