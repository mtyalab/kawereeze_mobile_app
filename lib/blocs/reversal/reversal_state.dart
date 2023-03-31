part of 'reversal_bloc.dart';

enum ReversalUiStage {INITIATING, DISPLAYING}

enum ReversalUiState {init, loading, failing, successful}



class ReversalState extends Equatable {
  final ReversalUiStage? uiStage;
  final ReversalUiState? uiState;
  final Reversal? reversal;
  final String? message;

  const ReversalState({this.uiStage, this.uiState, this.reversal, this.message});

  ReversalState copyWith({
    ReversalUiStage? uiStage,
    ReversalUiState? uiState = ReversalUiState.init,
    Reversal? reversal,
    String? message,
  }) {
    return ReversalState(
      uiStage: uiStage ?? this.uiStage,
      uiState: uiState ?? this.uiState,
      reversal: reversal ?? this.reversal,
      message: message ?? this.message
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [uiStage, uiState, reversal, message];
}
