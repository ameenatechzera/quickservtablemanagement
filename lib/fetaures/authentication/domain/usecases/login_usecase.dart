import 'package:quickservtablemanagement/core/usecases/general_usecases.dart';
import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/entities/login_entity.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/parameters/login_params.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/repositories/auth_repository.dart';

class LoginServerUseCase
    implements UseCaseWithParams<LoginResponseResult, LoginRequest> {
  final AuthRepository _authRepository;

  LoginServerUseCase(this._authRepository);

  @override
  ResultFuture<LoginResponseResult> call(LoginRequest loginRequest) async =>
      _authRepository.loginServer(loginRequest);
}
