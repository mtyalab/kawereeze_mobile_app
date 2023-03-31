part of 'password_reset_bloc.dart';

abstract class PasswordResetEvent extends Equatable {
  const PasswordResetEvent();
}

class PasswordResetRequestEvent extends PasswordResetEvent {
  final String email;


  const PasswordResetRequestEvent({required this.email});

  @override
  List<Object?> get props => [email];

}


class ResendPasswordResetRequestEvent extends PasswordResetEvent {
  final String? email;


  const ResendPasswordResetRequestEvent({required this.email});

  @override
  List<Object?> get props => [email];

}


class VerifyPasswordResetRequestEvent extends PasswordResetEvent {
  final String otp;
  final String? accountIdentifier;
  const VerifyPasswordResetRequestEvent({required this.otp, required this.accountIdentifier});

  @override
  // TODO: implement props
  List<Object?> get props => [otp, accountIdentifier];
}


class NewPasswordEvent extends PasswordResetEvent {
  final String password;
  final String? username;
  const NewPasswordEvent({required this.password, required this.username});
  @override
  // TODO: implement props
  List<Object?> get props => [password, username];

}