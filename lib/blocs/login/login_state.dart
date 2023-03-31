part of 'login_bloc.dart';

enum LoginUIState { Loading, Success, Failed, Init }

class LoginState extends Equatable {
  final LoginUIState? loginUIState;
  final String? message;
  final User? user;
  const LoginState({this.loginUIState, this.message, this.user});

  LoginState copyWith({
    LoginUIState? loginUIState = LoginUIState.Init,
    String? message,
    User? user,
  }) {
    return LoginState(
        loginUIState: loginUIState ?? this.loginUIState,
        message: message ?? this.message,
        user: user ?? this.user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [loginUIState, message, user];
}
