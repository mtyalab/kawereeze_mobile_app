part of 'password_reset_bloc.dart';


enum UIStage {REQUESTING, RESENDING, VERIFICATION, CREATION}

enum UIState {init, loading, failing, successful}

class PasswordResetState extends Equatable {
   final UIStage? uiStage;
   final UIState? uiState;
   final String? username;
   final String? message;
  const PasswordResetState({this.uiStage, this.uiState, this.username, this.message});

  PasswordResetState copyWith({
    UIStage? uiStage,
    UIState? uiState = UIState.init,
    String? username,
    String? message,
}) {
    return PasswordResetState(
      uiStage: uiStage ?? this.uiStage,
      uiState: uiState ?? this.uiState,
      username: username ?? this.username,
      message: message ?? this.message
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [uiStage, uiState, username, message];
}

