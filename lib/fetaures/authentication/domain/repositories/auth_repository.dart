import 'package:quickservtablemanagement/core/utils/typedef.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/entities/login_entity.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/entities/register_server_entity.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/parameters/login_params.dart';
import 'package:quickservtablemanagement/fetaures/authentication/domain/parameters/register_server_params.dart';

abstract class AuthRepository {
  ResultFuture<RegisterResponseResult> registerServer(
    RegisterServerRequest registerServerParams,
  );
  ResultFuture<LoginResponseResult> loginServer(LoginRequest loginRequest);

  // ResultFuture<MasterResponseModel> changePassword(
  //   ChangePasswordRequest request,
  // );
}
