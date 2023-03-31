part of 'signup_bloc.dart';

enum SignUpUIStage {INIT, LOADING, SUCCESS, FAILURE}

class SignupState extends Equatable {
  final SignUpUIStage? uiState;
  final User? user;
  final String? message;
  const SignupState({this.uiState, this.user, this.message});

  SignupState copyWith({
    SignUpUIStage? uiState = SignUpUIStage.INIT,
    User? user,
    String? message,
}) {
    return SignupState(
      uiState: uiState ?? this.uiState,
      user: user ?? this.user,
      message: message ?? this.message
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [uiState, user, message];
}

