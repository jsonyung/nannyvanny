import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/app_color.dart';
import '../widgets/custom_radio_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? _selectedCity; // Variable to store selected city
  int _selectedValue = 1;
  String? _selectedRelation;

  final List<String> _relations = [
    'Mother',
    'Father',
    'Guardian',
    'Sibling',
    'Grandparent',
    'Other'
  ];

  // List of Indian cities
  final List<String> _cities = [
    '',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Stack with a defined height
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  'assets/snake_line.svg',
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  'assets/baby_cart.svg',
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sign up to continue',
                style: GoogleFonts.alegreyaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Center(
                    child: Card(
                      margin: const EdgeInsets.fromLTRB(40, 40, 40, 10),
                      // Add margin to the Card
                      elevation: 3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 40, bottom: 20),
                        // Padding inside the Card
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min, // Adjust size based on content
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'Parent Name',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: Icon(Icons.person_outline_rounded,
                                    color: AppColors.customPink),
                                // Suffix icon
                                border: InputBorder.none,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Space between TextFields
                            TextField(
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: const InputDecoration(
                                hintText: 'Mobile Number',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: Icon(Icons.phone_android_outlined,
                                    color: AppColors.customPink),
                                // Suffix icon
                                border: InputBorder.none,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'Email Id',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.customPink,
                                ),
                                // Suffix icon
                                border: InputBorder.none,
                              ),
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                hintText: 'City',
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 20.0),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              value: _selectedCity,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCity = newValue;
                                });
                              },
                              items: _cities
                                  .map<DropdownMenuItem<String>>((String city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.customPink,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Number Of Children',
                                  style: TextStyle(
                                    color: AppColors.customPink,
                                    fontSize: 16,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomRadioButton(
                                  value: 1,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                  text: '1(One)', // Custom text size
                                ),
                                CustomRadioButton(
                                  value: 2,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                  text: '2(Two)',
                                ),
                                CustomRadioButton(
                                  value: 3,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                  text: 'More',
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                hintText: 'Relation With Child',
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 20.0),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              value: _selectedRelation,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedRelation = newValue;
                                });
                              },
                              items: _relations.map<DropdownMenuItem<String>>(
                                  (String relation) {
                                return DropdownMenuItem<String>(
                                  value: relation,
                                  child: Text(relation),
                                );
                              }).toList(),
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors
                                      .pink, // Change this color as per your theme
                                ),
                              ),
                            ),
                            const SizedBox(height: 60.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your onPressed action here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.customPink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                  ),
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 24.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            RichText(
                              text: TextSpan(
                                text: 'Already Have An Account? ',
                                style: GoogleFonts.alegreyaSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18.0,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: GoogleFonts.alegreyaSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle tap on 'Sign In'
                                        print('Sign In tapped!');
                                      },
                                  ),
                                ],
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
                      //color: Colors.red,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 40,
                    child: SvgPicture.asset(
                      'assets/clip2.svg',
                      height: 40,
                      width: 18,
                      // color: Colors.red,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 70,
                    child: SvgPicture.asset(
                      'assets/clip3.svg',
                      height: 42,
                      width: 19,
                      // color: Colors.red,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Handle skip action here
                  print('Skip tapped!');
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
