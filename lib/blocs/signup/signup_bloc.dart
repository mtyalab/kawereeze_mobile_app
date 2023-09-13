import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kawereeze/model/user.dart';
import '../../repositories/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc(this.authRepository) : super(SignupState()) {
    on<SignupEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is SignUpFormEvent) {
        await _signup(event, emit);
      }
    });
  }


  Future<void> _signup(SignUpFormEvent event, Emitter<SignupState> emit) async {
    try {
      emit(this.state.copyWith(uiState: SignUpUIStage.LOADING));
      final user = await authRepository.signup(event.firstName, event.surname,
          event.phoneNumber, event.email, event.password);
      print(user);
        emit(this.state.copyWith(uiState: SignUpUIStage.SUCCESS, user: user));
    } catch (e) {
      emit(this.state.copyWith(uiState: SignUpUIStage.FAILURE, message: '$e'));
    }
  }
}
