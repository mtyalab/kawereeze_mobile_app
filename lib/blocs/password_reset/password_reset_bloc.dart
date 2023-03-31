import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth_repository.dart';
import '../../utils/app_exceptions.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  AuthRepository authRepository;
  PasswordResetBloc({required this.authRepository})
      : super(PasswordResetState()) {
    on<PasswordResetEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is PasswordResetRequestEvent) {
        await _passwordResetRequest(event, emit);
      } else if (event is VerifyPasswordResetRequestEvent) {
        await _passwordResetRequestVerification(event, emit);
      } else if (event is NewPasswordEvent) {
        await _newPassword(event, emit);
      } else if (event is ResendPasswordResetRequestEvent) {
        await _resendPasswordResetRequest(event, emit);
      }
    });
  }

  Future<void> _passwordResetRequest(
      PasswordResetRequestEvent event, Emitter<PasswordResetState> emit) async {
    try {
      emit(this
          .state
          .copyWith(uiStage: UIStage.REQUESTING, uiState: UIState.loading));
      final resetRequest =
          await authRepository.passwordResetRequest(event.email);
      if(resetRequest != true) {
        emit(this.state.copyWith(
            uiStage: UIStage.REQUESTING,
            uiState: UIState.successful,
            username: resetRequest.email));
      }

    }  catch (e) {
      emit(this.state.copyWith(
          uiStage: UIStage.REQUESTING,
          uiState: UIState.failing,
          username: event.email));
    }
  }

  Future<void> _resendPasswordResetRequest(
      ResendPasswordResetRequestEvent event,
      Emitter<PasswordResetState> emit) async {
    try {
      emit(this.state.copyWith(
            uiStage: UIStage.RESENDING,
            uiState: UIState.loading,
          ));
      final resetRequest =
          await authRepository.passwordResetRequest(event.email);
      emit(this.state.copyWith(
          uiStage: UIStage.RESENDING,
          uiState: UIState.successful,
          username: resetRequest.email));
    } catch (e) {
      emit(this.state.copyWith(
          uiStage: UIStage.RESENDING,
          uiState: UIState.failing,
          username: event.email));
    }
  }

  Future<void> _passwordResetRequestVerification(
      VerifyPasswordResetRequestEvent event,
      Emitter<PasswordResetState> emit) async {
    try {
      emit(this
          .state
          .copyWith(uiStage: UIStage.VERIFICATION, uiState: UIState.loading));
      await authRepository.passwordResetRequestVerification(
          event.otp, event.accountIdentifier);
      emit(this.state.copyWith(
          uiStage: UIStage.VERIFICATION, uiState: UIState.successful));
    }  catch (e) {
      emit(this.state.copyWith(
          uiStage: UIStage.VERIFICATION,
          uiState: UIState.failing,
          message: '$e'));
    }
  }

  Future<void> _newPassword(
      NewPasswordEvent event, Emitter<PasswordResetState> emit) async {
    try {
      emit(this
          .state
          .copyWith(uiStage: UIStage.CREATION, uiState: UIState.loading));
      await authRepository.newPassword(event.username, event.password);
      emit(this
          .state
          .copyWith(uiStage: UIStage.CREATION, uiState: UIState.successful));
    } catch (e) {
      emit(this.state.copyWith(
          uiStage: UIStage.CREATION, uiState: UIState.failing, message: '$e'));
    }
  }
}
