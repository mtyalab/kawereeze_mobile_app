part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class GetTransactionsEvent extends TransactionEvent {
  final String? userId;

  const GetTransactionsEvent({required this.userId,});

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,

      ];
}
