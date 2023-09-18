import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kawereeze/repositories/verification_repository.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../model/verification.dart';
import '../../utils/constant_utils.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationRepo verificationRepo;
  VerificationBloc({required this.verificationRepo})
      : super(VerificationState()) {
    on<VerificationEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is AddIdentityEvent) {
        await addIdentityDetails(event, emit);
      } else if (event is GetIdentityByUserIdEvent) {
        await getIdentityByUserId(event, emit);
      }
    });
  }

  Future<void> getIdentityByUserId(
      GetIdentityByUserIdEvent event, Emitter<VerificationState> emit) async {
    try {
      emit(state.copyWith(
          verificationViewUiFlow: VerificationViewUiFlow.view,
          verificationViewUiState: VerificationViewUiState.isLoading));
      final identity =
          await verificationRepo.getVerificationByUserId(event.userId);
      emit(state.copyWith(
          verificationViewUiFlow: VerificationViewUiFlow.view,
          verificationViewUiState: VerificationViewUiState.isLoadingComplete,
          verifications: identity));
    } catch (e) {
      emit(state.copyWith(
          verificationViewUiFlow: VerificationViewUiFlow.view,
          verificationViewUiState: VerificationViewUiState.isLoadingFailed,
          message: 'Failed to load identity details'));
    }
  }

  Future<void> addIdentityDetails(
      AddIdentityEvent event, Emitter<VerificationState> emit) async {
    emit(state.copyWith(
      verificationViewUiFlow: VerificationViewUiFlow.add,
      verificationViewUiState: VerificationViewUiState.isLoading,
    ));

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/identity/add/${event.userId}'), // Replace with your API endpoint
      );

      request.fields['id_type'] = event.idType;
      request.files.add(await http.MultipartFile.fromPath(
        'selfie_file',
        event.selfieUrl!,
        contentType: MediaType(
            'application', 'octet-stream'), // Adjust the content type if needed
      ));

      request.files.add(await http.MultipartFile.fromPath(
        'id_file',
        event.idUrl!,
        contentType: MediaType(
            'application', 'octet-stream'), // Adjust the content type if needed
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        emit(state.copyWith(
          verificationViewUiFlow: VerificationViewUiFlow.add,
          verificationViewUiState: VerificationViewUiState.isLoadingComplete,
          message: 'Successfully added',
        ));
      } else {
        emit(state.copyWith(
          verificationViewUiFlow: VerificationViewUiFlow.add,
          verificationViewUiState: VerificationViewUiState.isLoadingFailed,
          message: 'can\'t upload identity details',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        verificationViewUiFlow: VerificationViewUiFlow.add,
        verificationViewUiState: VerificationViewUiState.isLoadingFailed,
        message: 'Error occurred',
      ));
    }
  }
}
