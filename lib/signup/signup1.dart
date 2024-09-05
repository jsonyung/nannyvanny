import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage1 extends StatefulWidget {
  const SignupPage1({Key? key}) : super(key: key);

  @override
  State<SignupPage1> createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  int _numberOfChildren = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Positioned(
                    top: 40,
                    right: 20,
                    child: SvgPicture.asset(
                      'assets/snake_line.svg',
                      // Replace with your top corner SVG image
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(height: 150), // Adjust as needed
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Parent Name',
                                  suffixIcon: Icon(Icons.person_2_outlined),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                  suffixIcon: Icon(Icons.phone_android),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email Id',
                                  suffixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'City',
                                  suffixIcon:
                                      Icon(Icons.location_city_outlined),
                                ),
                              ),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Number Of Children',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text('1(One)'),
                                      value: 1,
                                      groupValue: _numberOfChildren,
                                      onChanged: (value) {
                                        setState(() {
                                          _numberOfChildren = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text('2(Two)'),
                                      value: 2,
                                      groupValue: _numberOfChildren,
                                      onChanged: (value) {
                                        setState(() {
                                          _numberOfChildren = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<int>(
                                      title: Text('More'),
                                      value: 3,
                                      groupValue: _numberOfChildren,
                                      onChanged: (value) {
                                        setState(() {
                                          _numberOfChildren = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Relation With Child',
                                  suffixIcon:
                                      Icon(Icons.family_restroom_outlined),
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle the button press
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pinkAccent,
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Text('Next'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -40, // Adjust this value as needed
                        left: -20, // Adjust this value as needed
                        child: SvgPicture.asset(
                          'assets/safety_pin.svg',
                          // Replace with your safety pin SVG image
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have An Account? "),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Sign In page
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Handle the skip action
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
