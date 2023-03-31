part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignUpFormEvent extends SignupEvent {
  final String firstName;
  final String surname;
  final String phoneNumber;
  final String email;
  final String password;
  const SignUpFormEvent({required this.firstName, required this.surname, required this.phoneNumber, required this.email, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [firstName, surname, phoneNumber, email, password];

}

