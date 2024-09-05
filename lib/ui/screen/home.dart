import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nannyvanny/values/app_color.dart';
import 'package:nannyvanny/widgets/booking_card.dart';

import '../../bloc/bookings/bookings_bloc.dart';
import '../../bloc/packages/packages_bloc.dart';
import '../../widgets/package_card.dart';

class Home extends StatefulWidget {
  final DrawerScaffoldController drawerController;

  const Home({super.key, required this.drawerController});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<BookingsBloc>().add(FetchBookings());
    context.read<PackagesBloc>().add(FetchPackages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 50), // Adjust spacing as needed
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0, top: 26.0),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/bars.svg',
                        height: 18,
                        width: 18,
                      ),
                      onPressed: () {
                        // Open the drawer
                        widget.drawerController.openDrawer();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.customPink,
                          width: 1.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // SizedBox(height: 2),
                        Text(
                          'Emily Cyrus',
                          style: TextStyle(
                            color: AppColors.customPink,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Space between the icon and card
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 20, left: 30, right: 30),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: AppColors.customLightPink,
                        //margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 30, right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              const Text(
                                'Nanny And \nBabysitting Services',
                                style: TextStyle(
                                  color: AppColors.customBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle button press
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.customBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 16),
                                  minimumSize: Size.zero,
                                ),
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -2,
                    top: 4,
                    child: Image.asset(
                      'assets/nannyp.png',
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your Current Booking',
                  style: TextStyle(
                    color: AppColors.customBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<BookingsBloc, BookingsState>(
                builder: (context, state) {
                  if (state is BookingsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BookingsLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.bookings.length,
                      itemBuilder: (context, index) {
                        //Booking booking = state.bookings[index];
                        return BookingCard(
                            booking: state.bookings[index], index: index);
                      },
                    );
                  } else if (state is BookingsError) {
                    return Text('Error: ${state.error}');
                  }
                  return Container();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Packages',
                  style: TextStyle(
                    color: AppColors.customBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<PackagesBloc, PackagesState>(
                builder: (context, state) {
                  if (state is PackagesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PackagesLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.packages.length,
                      itemBuilder: (context, index) {
                        //Package package = state.packages[index];
                        return PackageCard(
                          package: state.packages[index],
                          index: index,
                        );
                      },
                    );
                  } else if (state is PackagesError) {
                    return Text('Error: ${state.error}');
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
