import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kawereeze/model/user.dart';

import '../../repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc(this.authRepository) : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is LoginFormSubmittedEvent) {
        await _login(event, emit);
      }
    });
  }

  Future<void> _login(
    LoginFormSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(this.state.copyWith(loginUIState: LoginUIState.Loading));
    try {
      final user = await authRepository.login(event.username, event.password);

        emit(this.state.copyWith(
            loginUIState: LoginUIState.Success,
            message: 'Logged in Successfully',
            user: user));

    } catch (e) {
      emit(this
          .state
          .copyWith(loginUIState: LoginUIState.Failed, message: '$e'));
    }
  }
}
