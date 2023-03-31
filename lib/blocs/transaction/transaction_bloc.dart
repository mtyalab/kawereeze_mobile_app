import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kawereeze/model/transaction.dart';

import '../../repositories/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionRepository transactionRepository;
  TransactionBloc({required this.transactionRepository})
      : super(TransactionState()) {
    on<TransactionEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetTransactionsEvent) {
        await _getTransactions(event, emit);
      }
    });
  }

  Future<void> _getTransactions(
      GetTransactionsEvent event, Emitter<TransactionState> emit) async {
    try {
      emit(this.state.copyWith(uiState: TransactionUIState.LOADING));
      final transaction =
          await transactionRepository.getTransactions(event.userId);

      emit(this.state.copyWith(
          uiState: TransactionUIState.SUCCESS, transaction: transaction));
    } catch (e) {
      emit(this.state.copyWith(
          uiState: TransactionUIState.FAILED,
          message:
              "$e"));
    }
  }
}
