part of 'sign_up_form_bloc.dart';

abstract class SignupFormEvent {}

class UpdateParentName extends SignupFormEvent {
  final String name;

  UpdateParentName(this.name);
}

class UpdateMobileNumber extends SignupFormEvent {
  final String number;

  UpdateMobileNumber(this.number);
}

class UpdateEmail extends SignupFormEvent {
  final String email;

  UpdateEmail(this.email);
}

class UpdateCity extends SignupFormEvent {
  final String city;

  UpdateCity(this.city);
}

class UpdateNumberOfChildren extends SignupFormEvent {
  final int number;

  UpdateNumberOfChildren(this.number);
}

class UpdateRelation extends SignupFormEvent {
  final String relation;

  UpdateRelation(this.relation);
}

class SignUpSubmitted extends SignupFormEvent {
  final String parentName;
  final String mobileNumber;
  final String email;
  final String city;
  final int numberOfChildren;
  final String relation;

  SignUpSubmitted({
    required this.parentName,
    required this.mobileNumber,
    required this.email,
    required this.city,
    required this.numberOfChildren,
    required this.relation,
  });

  @override
  List<Object?> get props =>
      [parentName, mobileNumber, email, city, numberOfChildren, relation];
}
