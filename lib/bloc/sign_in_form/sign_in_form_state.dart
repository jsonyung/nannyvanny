part of 'sign_in_form_bloc.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  final String mobileNumber;
  final SignInStatus status;
  final String? errorMessage;

  const SignInState({
    this.mobileNumber = '',
    this.status = SignInStatus.initial,
    this.errorMessage,
  });

  SignInState copyWith({
    String? mobileNumber,
    SignInStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [mobileNumber, status, errorMessage];
}
