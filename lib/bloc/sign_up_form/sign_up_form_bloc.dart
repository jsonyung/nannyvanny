import 'package:bloc/bloc.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  SignupFormBloc() : super(SignupFormState.initial()) {
    on<UpdateParentName>((event, emit) {
      print('Parent Name Updated: ${event.name}');
      emit(state.copyWith(parentName: event.name));
    });
    on<UpdateMobileNumber>((event, emit) {
      print('Mobile Number Updated: ${event.number}');
      emit(state.copyWith(mobileNumber: event.number));
    });
    on<UpdateEmail>((event, emit) {
      print('Email Updated: ${event.email}');
      emit(state.copyWith(email: event.email));
    });
    on<UpdateCity>((event, emit) {
      print('City Updated: ${event.city}');
      emit(state.copyWith(city: event.city));
    });
    on<UpdateNumberOfChildren>((event, emit) {
      print('Number of Children Updated: ${event.number}');
      emit(state.copyWith(numberOfChildren: event.number));
    });
    on<UpdateRelation>((event, emit) {
      print('Relation Updated: ${event.relation}');
      emit(state.copyWith(relation: event.relation));
    });
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<SignupFormState> emit) async {
    // Emit state with loading status and current values
    emit(state.copyWith(
      status: SignupFormStatus.loading,
    ));

    // Simulate signup process
    await Future.delayed(const Duration(seconds: 2));

    // Print the state and event values for debugging purposes
    print('Parent Name from event: ${event.parentName}');
    print('Mobile Number from event: ${event.mobileNumber}');
    print('Email from event: ${event.email}');
    print('City from event: ${event.city}');
    print('Number of Children from event: ${event.numberOfChildren}');
    print('Relation from event: ${event.relation}');

    // Check if all fields from event are filled
    if (event.parentName.isNotEmpty &&
        event.mobileNumber.isNotEmpty &&
        event.email.isNotEmpty &&
        event.city.isNotEmpty &&
        event.numberOfChildren > 0 &&
        event.relation.isNotEmpty) {
      emit(state.copyWith(status: SignupFormStatus.success));
    } else {
      emit(state.copyWith(
        status: SignupFormStatus.failure,
        errorMessage: 'Please fill all fields',
      ));
    }
  }
}
