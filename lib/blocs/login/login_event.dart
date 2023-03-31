part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginFormSubmittedEvent extends LoginEvent {
  final String username;
  final String password;
  const LoginFormSubmittedEvent({required this.username, required this.password});

  @override
  String toString() =>
      'LoginFormSubmittedEvent {username: $username, password: $password}';

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}

class LogoutEvent extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}