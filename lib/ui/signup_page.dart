import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/dropdown/dropdown_bloc.dart';
import '../bloc/sign_up_form/sign_up_form_bloc.dart';
import '../values/app_color.dart';
import '../widgets/custom_dropdwon_menu.dart';
import '../widgets/custom_radio_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/radio_button_group.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupFormBloc _signupFormBloc = SignupFormBloc();
  final DropdownBloc _cityDropdownBloc = DropdownBloc('');
  final DropdownBloc _relationDropdownBloc = DropdownBloc('');

  final List<String> _cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Kolkata',
    'Chennai',
    'Hyderabad',
    'Pune',
    'Ahmedabad',
    'Jaipur',
    'Surat',
    'Other',
  ];

  final List<String> _relations = [
    'Mother',
    'Father',
    'Guardian',
    'Sibling',
    'Grandparent',
    'Other'
  ];

  String _parentName = '';
  String _mobileNumber = '';
  String _email = '';
  String _city = '';
  int _numberOfChildren = 1; // Default value
  String _relation = '';

  @override
  void dispose() {
    _signupFormBloc.close();
    _cityDropdownBloc.close();
    _relationDropdownBloc.close();
    super.dispose();
  }

  void _onSkipButtonPressed() {
    if (kDebugMode) {
      print('Skip tapped!');
    }
  }

  void _onSignInTap() {
    Navigator.pushReplacementNamed(context, '/signin');
  }

  Future<bool> _showExitConfirmationDialog() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit Sign Up'),
            content: const Text(
                'Are you sure you want to exit the sign-up process?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                // User pressed Cancel
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                // User pressed Yes
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showExitConfirmationDialog, // Intercept back button press
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<SignupFormBloc, SignupFormState>(
          listener: (context, state) {
            if (state.status == SignupFormStatus.success) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state.status == SignupFormStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Signup failed'),
                ),
              );
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<SignupFormBloc, SignupFormState>(
                bloc: _signupFormBloc,
                builder: (context, state) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          'assets/snake_line.svg',
                          height: 60,
                          width: 60,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset(
                          'assets/baby_cart.svg',
                          height: 60,
                          width: 60,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Sign up to continue',
                        style: GoogleFonts.alegreyaSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Stack(
                        children: [
                          Center(
                            child: Card(
                              margin: const EdgeInsets.fromLTRB(40, 40, 40, 10),
                              elevation: 3,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 40, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildCustomTextField(
                                      hintText: 'Parent Name',
                                      svgIcon: 'assets/person.svg',
                                      onChanged: (value) {
                                        _signupFormBloc
                                            .add(UpdateParentName(value));
                                        setState(() {
                                          _parentName =
                                              value; // Update state variable
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    _buildCustomTextField(
                                      hintText: 'Mobile Number',
                                      svgIcon: 'assets/telephone.svg',
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(10),
                                      ],
                                      onChanged: (value) {
                                        _signupFormBloc
                                            .add(UpdateMobileNumber(value));
                                        setState(() {
                                          _mobileNumber =
                                              value; // Update state variable
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    _buildCustomTextField(
                                      hintText: 'Email Id',
                                      svgIcon: 'assets/email.svg',
                                      onChanged: (value) {
                                        _signupFormBloc.add(UpdateEmail(value));
                                        setState(() {
                                          _email =
                                              value; // Update state variable
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    DropdownMenuWidget(
                                      hintText: 'City',
                                      selectedValueStream: _cityDropdownBloc
                                          .stream
                                          .map((state) => state.selectedValue),
                                      items: _cities,
                                      onChanged: (newValue) {
                                        _cityDropdownBloc.add(
                                            UpdateDropdownSelection(
                                                newValue ?? '',
                                                DropdownType.city));
                                        _signupFormBloc
                                            .add(UpdateCity(newValue!));
                                        setState(() {
                                          _city =
                                              newValue; // Update state variable
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 30),
                                    const Text(
                                      'Number Of Children',
                                      style: TextStyle(
                                          color: AppColors.customPink,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(height: 10),
                                    RadioButtonGroup(
                                      selectedValue: state.numberOfChildren,
                                      onChanged: (value) {
                                        _signupFormBloc.add(
                                            UpdateNumberOfChildren(value ?? 1));
                                        setState(() {
                                          _numberOfChildren =
                                              value!; // Update state variable
                                        });
                                      },
                                      buttons: [
                                        CustomRadioButton(
                                          value: 1,
                                          groupValue: state.numberOfChildren,
                                          text: '1(One)',
                                        ),
                                        CustomRadioButton(
                                          value: 2,
                                          groupValue: state.numberOfChildren,
                                          text: '2(Two)',
                                        ),
                                        CustomRadioButton(
                                          value: 3,
                                          groupValue: state.numberOfChildren,
                                          text: 'More',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    DropdownMenuWidget(
                                      hintText: 'Relation With Child',
                                      selectedValueStream: _relationDropdownBloc
                                          .stream
                                          .map((state) => state.selectedValue),
                                      items: _relations,
                                      onChanged: (newValue) {
                                        _relationDropdownBloc.add(
                                            UpdateDropdownSelection(
                                                newValue ?? '',
                                                DropdownType.relation));
                                        _signupFormBloc
                                            .add(UpdateRelation(newValue!));
                                        setState(() {
                                          _relation =
                                              newValue; // Update state variable
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 60.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: state.status ==
                                                  SignupFormStatus.loading
                                              ? null
                                              : () {
                                                  context
                                                      .read<SignupFormBloc>()
                                                      .add(SignUpSubmitted(
                                                        parentName: _parentName,
                                                        mobileNumber:
                                                            _mobileNumber,
                                                        email: _email,
                                                        city: _city,
                                                        numberOfChildren:
                                                            _numberOfChildren,
                                                        relation: _relation,
                                                      ));
                                                },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.customPink,
                                            disabledBackgroundColor:
                                                AppColors.customPink,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            elevation: state.status ==
                                                    SignupFormStatus.loading
                                                ? 0
                                                : 3,
                                          ),
                                          child: state.status ==
                                                  SignupFormStatus.loading
                                              ? const SizedBox(
                                                  height: 24,
                                                  width: 24,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                    strokeWidth: 2.0,
                                                  ),
                                                )
                                              : const Text(
                                                  'Next',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    Center(
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Already Have An Account? ',
                                          style: GoogleFonts.alegreyaSans(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16.0,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Sign In',
                                              style: GoogleFonts.alegreyaSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = _onSignInTap,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            left: 18,
                            child: SvgPicture.asset(
                              'assets/safety_pin.svg',
                              height: 100,
                              width: 80,
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 40,
                            child: SvgPicture.asset(
                              'assets/clip1.svg',
                              height: 40,
                              width: 18,
                            ),
                          ),
                          Positioned(
                            top: 80,
                            left: 40,
                            child: SvgPicture.asset(
                              'assets/clip2.svg',
                              height: 40,
                              width: 18,
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 70,
                            child: SvgPicture.asset(
                              'assets/clip3.svg',
                              height: 42,
                              width: 19,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: _onSkipButtonPressed,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required String hintText,
    required String svgIcon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    required ValueChanged<String> onChanged,
  }) {
    return CustomTextField(
      hintText: hintText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      suffixIcon: SizedBox(
        height: 24,
        width: 24,
        child: SvgPicture.asset(
          svgIcon,
          color: AppColors.customPink,
          fit: BoxFit.scaleDown, // Ensures SVG respects the size constraints
        ),
      ),
      onChanged: onChanged,
    );
  }
}
