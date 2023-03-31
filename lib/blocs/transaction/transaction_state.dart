part of 'transaction_bloc.dart';

enum TransactionUIState {INIT, LOADING, SUCCESS, FAILED}

class TransactionState extends Equatable {
  final TransactionUIState? uiState;
  final Transaction? transaction;
  final String? message;
  const TransactionState({this.uiState, this.transaction, this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [uiState, transaction, message];

  TransactionState copyWith({
    TransactionUIState? uiState,
    Transaction? transaction,
    String? message,
}) {
    return TransactionState(
      uiState: uiState ?? this.uiState,
      transaction: transaction ?? this.transaction,
      message: message ?? this.message
    );
  }

}

