part of 'reversal_bloc.dart';

abstract class ReversalEvent extends Equatable {
  const ReversalEvent();
}

class InitiateReversalEvent extends ReversalEvent {
  final String transactionId;
  final String userId;
  const InitiateReversalEvent({required this.transactionId, required this.userId});

  @override
  // TODO: implement props
  List<Object?> get props => [transactionId, userId];
}

class GetReversalEvent extends ReversalEvent {
  final String userId;
  const GetReversalEvent({required this.userId});

  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}
