import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/sign_in_form/sign_in_form_bloc.dart';
import '../values/app_color.dart';
import '../widgets/custom_textfield.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late final SignInBloc _signInBloc;
  final TextEditingController _mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _signInBloc = SignInBloc();
  }

  @override
  void dispose() {
    _signInBloc.close();
    _mobileController.dispose();
    super.dispose();
  }

  void _onVerifyPressed() {
    _signInBloc.add(SignInSubmitted(_mobileController.text.trim()));
  }

  void _onForgotPasswordPressed() {
    if (kDebugMode) {
      print('Forgot Password? tapped!');
    }
  }

  void _onSignUpLinkPressed() {
    Navigator.pushReplacementNamed(context, '/signup');
  }

  Widget _buildCustomTextField({
    required String hintText,
    required String svgIcon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    required ValueChanged<String> onChanged,
  }) {
    return CustomTextField(
      controller: _mobileController,
      hintText: hintText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      suffixIcon: SizedBox(
        height: 24,
        width: 24,
        child: SvgPicture.asset(
          svgIcon,
          color: AppColors.customPink,
          fit: BoxFit.scaleDown,
        ),
      ),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (_) => _signInBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocListener<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state.status == SignInStatus.success) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else if (state.status == SignInStatus.failure) {
                  // Check if a SnackBar is already visible, dismiss it first
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  // Show the new SnackBar and set duration so it dismisses automatically
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text(state.errorMessage ?? 'Authentication Failure'),
                      duration: const Duration(
                          seconds: 3), // Auto close after 3 seconds
                    ),
                  );
                }
              },
              child: Column(
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
                    'Sign in to continue',
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
                                BlocBuilder<SignInBloc, SignInState>(
                                  builder: (context, state) {
                                    return _buildCustomTextField(
                                      hintText: 'Mobile Number',
                                      svgIcon: 'assets/telephone.svg',
                                      // Replace with your SVG path
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(10),
                                      ],
                                      onChanged: (value) {
                                        context.read<SignInBloc>().add(
                                            SignInMobileNumberChanged(value));
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 60.0),
                                BlocBuilder<SignInBloc, SignInState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: state.status ==
                                                  SignInStatus.loading
                                              ? null
                                              : _onVerifyPressed,
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
                                                    SignInStatus.loading
                                                ? 0
                                                : 3,
                                          ),
                                          child: state.status ==
                                                  SignInStatus.loading
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
                                                  'Verify',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 30.0),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Don't Have An Account? ",
                                      style: GoogleFonts.alegreyaSans(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Sign Up',
                                          style: GoogleFonts.alegreyaSans(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = _onSignUpLinkPressed,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Forgot Password?',
                                      style: const TextStyle(
                                        color: AppColors.customPink,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = _onForgotPasswordPressed,
                                    ),
                                  ),
                                ),
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
                    onTap: () {
                      if (kDebugMode) {
                        print('Skip tapped!');
                      }
                    },
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
