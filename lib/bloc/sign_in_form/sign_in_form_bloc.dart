import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInMobileNumberChanged>(_onMobileNumberChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  void _onMobileNumberChanged(
      SignInMobileNumberChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(mobileNumber: event.mobileNumber));
  }

  Future<void> _onSignInSubmitted(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: SignInStatus.loading));

    // Simulate authentication process
    await Future.delayed(const Duration(seconds: 2));

    // Here you would typically call a repository or use case to perform sign-in
    // For demonstration, we'll assume sign-in is always successful if mobile number is 10 digits
    if (event.mobileNumber.length == 10) {
      emit(state.copyWith(status: SignInStatus.success));
    } else {
      emit(state.copyWith(
        status: SignInStatus.failure,
        errorMessage: 'Invalid mobile number',
      ));
    }
  }
}
