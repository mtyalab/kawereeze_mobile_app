part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();
}

class GetIdentityByUserIdEvent extends VerificationEvent {
  final String userId;
  const GetIdentityByUserIdEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}


class AddIdentityEvent extends VerificationEvent {
  final String idType;
  final String userId;
  final String? selfieUrl;
  final String? idUrl;
  const AddIdentityEvent({required this.idType, required this.selfieUrl, required this.idUrl, required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [idType, userId, selfieUrl, idUrl];
}
