import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nannyvanny/repository/bookings_repository.dart';
import 'package:nannyvanny/repository/packages_repository.dart';
import 'package:nannyvanny/ui/main_page.dart';
import 'package:nannyvanny/ui/signin_page.dart';
import 'package:nannyvanny/ui/signup_page.dart';
import 'package:nannyvanny/values/app_color.dart';

import 'bloc/bookings/bookings_bloc.dart';
import 'bloc/dropdown/dropdown_bloc.dart';
import 'bloc/main_page/main_page_bloc.dart';
import 'bloc/packages/packages_bloc.dart';
import 'bloc/sign_up_form/sign_up_form_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingsRepository = BookingsRepository();
    final packagesRepository = PackagesRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignupFormBloc()),
        BlocProvider(create: (_) => DropdownBloc('')),
        BlocProvider(create: (_) => TabNavigationBloc()),
        BlocProvider(create: (_) => BookingsBloc(bookingsRepository)),
        BlocProvider(create: (_) => PackagesBloc(packagesRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.alegreyaSansTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.customPink,
            primary: AppColors.customPink,
            secondary: AppColors.customPink,
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.customPink),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.customPink),
            ),
            hintStyle: TextStyle(color: Colors.grey[600]),
          ),
          useMaterial3: true,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.cursorColor,
          ),
        ),
        home: SigninPage(),
      ),
    );
  }
}
