part of 'sign_up_form_bloc.dart';

enum SignupFormStatus { initial, loading, success, failure }

class SignupFormState {
  final String parentName;
  final String mobileNumber;
  final String email;
  final String city;
  final int numberOfChildren;
  final String relation;
  final SignupFormStatus status;
  final String? errorMessage;

  const SignupFormState({
    required this.parentName,
    required this.mobileNumber,
    required this.email,
    required this.city,
    required this.numberOfChildren,
    required this.relation,
    this.status = SignupFormStatus.initial,
    this.errorMessage,
  });

  const SignupFormState.initial()
      : parentName = '',
        mobileNumber = '',
        email = '',
        city = '',
        numberOfChildren = 1,
        relation = '',
        status = SignupFormStatus.initial,
        errorMessage = null;

  SignupFormState copyWith({
    String? parentName,
    String? mobileNumber,
    String? email,
    String? city,
    int? numberOfChildren,
    String? relation,
    SignupFormStatus? status,
    String? errorMessage,
  }) {
    return SignupFormState(
      parentName: parentName ?? this.parentName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      city: city ?? this.city,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      relation: relation ?? this.relation,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
