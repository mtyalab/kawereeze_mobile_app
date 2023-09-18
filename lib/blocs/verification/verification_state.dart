part of 'verification_bloc.dart';

enum VerificationViewUiState {
  isInit,
  isLoading,
  isLoadingComplete,
  isLoadingFailed
}

enum VerificationViewUiFlow { view, add }

class VerificationState extends Equatable {
  final VerificationViewUiFlow? verificationViewUiFlow;
  final VerificationViewUiState? verificationViewUiState;
  final Verifications? verifications;
  final String? message;
  const VerificationState({
    this.verificationViewUiFlow,
    this.verificationViewUiState,
    this.verifications,
    this.message
});

  @override
  List<Object?> get props =>
      [verificationViewUiFlow, verificationViewUiState, verifications, message];

  VerificationState copyWith({
    VerificationViewUiFlow? verificationViewUiFlow,
    VerificationViewUiState? verificationViewUiState = VerificationViewUiState.isInit,
    Verifications? verifications,
    String? message,
  }) {
    return VerificationState(
        verificationViewUiFlow: verificationViewUiFlow ?? this.verificationViewUiFlow,
        verificationViewUiState: verificationViewUiState ?? this.verificationViewUiState,
        verifications: verifications ?? this.verifications,
        message: message ?? this.message);
  }
}
