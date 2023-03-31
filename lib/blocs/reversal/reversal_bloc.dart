import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kawereeze/model/reversal.dart';

import '../../repositories/transaction_repository.dart';

part 'reversal_event.dart';
part 'reversal_state.dart';

class ReversalBloc extends Bloc<ReversalEvent, ReversalState> {
  TransactionRepository transactionRepository;
  ReversalBloc({required this.transactionRepository}) : super(ReversalState()) {
    on<ReversalEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is InitiateReversalEvent) {
        await _initiateReversal(event, emit);
      } else if (event is GetReversalEvent) {
        await _getReversals(event, emit);
      }
    });
  }

  Future<void> _initiateReversal(
      InitiateReversalEvent event, Emitter<ReversalState> emit) async {
    try {
      emit(this.state.copyWith(
            uiStage: ReversalUiStage.INITIATING,
            uiState: ReversalUiState.loading,
          ));
      await transactionRepository.initiateReversal(
          event.transactionId, event.userId);
      emit(this.state.copyWith(
            uiStage: ReversalUiStage.INITIATING,
            uiState: ReversalUiState.successful,
          ));
    } catch (e) {
      emit(this.state.copyWith(
          uiStage: ReversalUiStage.INITIATING,
          uiState: ReversalUiState.failing,
          message: '$e'));
    }
  }

  Future<void> _getReversals(
      GetReversalEvent event, Emitter<ReversalState> emit) async {
    try {
      emit(this.state.copyWith(
            uiStage: ReversalUiStage.DISPLAYING,
            uiState: ReversalUiState.loading,
          ));
      final reversal = await transactionRepository.getReversals(event.userId);
      emit(this.state.copyWith(
          uiStage: ReversalUiStage.INITIATING,
          uiState: ReversalUiState.successful,
          reversal: reversal));
    }  catch (e) {
      emit(this.state.copyWith(
          uiStage: ReversalUiStage.INITIATING,
          uiState: ReversalUiState.failing,
          message: '$e'));
    }
  }
}
