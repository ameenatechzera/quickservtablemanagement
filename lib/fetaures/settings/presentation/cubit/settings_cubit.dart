import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickservtablemanagement/fetaures/settings/data/models/fetch_settings_model.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/toke_update_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/entities/token_details_entity.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/parameters/update_token_parameter.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/usecases/fetch_currentsalestoken_usecase.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/usecases/fetch_settings_usecase.dart';
import 'package:quickservtablemanagement/fetaures/settings/domain/usecases/update_salestoken_usecase.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final FetchSettingsUseCase _fetchSettingsUseCase;
  final FetchCurrentSalesTokenUseCase _fetchCurrentSalesTokenUseCase;
  final UpdateSalesTokenUseCase _updateSalesTokenUseCase;

  SettingsCubit({
    required FetchSettingsUseCase fetchSettingsUseCase,
    required FetchCurrentSalesTokenUseCase fetchCurrentSalesTokenUseCase,
    required UpdateSalesTokenUseCase updateSalesTokenUseCase,
  }) : _fetchSettingsUseCase = fetchSettingsUseCase,
       _fetchCurrentSalesTokenUseCase = fetchCurrentSalesTokenUseCase,
       _updateSalesTokenUseCase = updateSalesTokenUseCase,
       super(SettingsInitial());

  Future<void> fetchSettings() async {
    emit(SettingsLoading());

    final response = await _fetchSettingsUseCase();

    response.fold(
      (failure) => emit(SettingsError(error: failure.message)),
      (response) => emit(SettingsLoaded(settings: response)),
    );
  }

  Future<void> fetchSalesTokenFromServer() async {
    emit(FetchSalesTokenLoading());
    try {
      print('reached cubit');
      final response = await _fetchCurrentSalesTokenUseCase();
      log(response.toString(), name: 'result_settings');

      response.fold(
        (failure) async {
          log("failure");
          emit(FetchSalesTokenError(failure.message));
        },
        (success) {
          log(success.message);

          emit(FetchSalesTokenSuccess(success));
        },
      );
    } catch (e) {
      emit(FetchSalesTokenError('An error occurred: $e'));
    }
  }

  Future<void> updateSalesTokenFromServer(
    UpdateSalesTokenRequest updateTokenRequest,
  ) async {
    emit(UpdateSalesTokenLoading());
    try {
      print('reached cubit');
      final response = await _updateSalesTokenUseCase(updateTokenRequest);
      log(response.toString(), name: 'result_settings');

      response.fold(
        (failure) async {
          log("failure");
          emit(UpdateSalesTokenError(failure.message));
        },
        (success) {
          log(success.message);

          emit(UpdateSalesTokenSuccess(success));
        },
      );
    } catch (e) {
      emit(UpdateSalesTokenError('An error occurred: $e'));
    }
  }
}
