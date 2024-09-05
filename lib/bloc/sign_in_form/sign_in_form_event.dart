part of 'sign_in_form_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInMobileNumberChanged extends SignInEvent {
  final String mobileNumber;

  const SignInMobileNumberChanged(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}

class SignInSubmitted extends SignInEvent {
  final String mobileNumber;

  const SignInSubmitted(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}
