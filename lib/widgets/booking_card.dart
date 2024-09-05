import 'package:flutter/material.dart';
import 'package:nannyvanny/values/app_color.dart';

import '../model/booking_model.dart';
import 'custom_elevated_button.dart';
import 'date_time_column.dart'; // Import your booking model

class BookingCard extends StatelessWidget {
  final Booking booking;
  final int index;

  const BookingCard({super.key, required this.booking, required this.index});

  @override
  Widget build(BuildContext context) {
    // Fixed background color for all cards
    final backgroundColor = Colors.white;

    // Colors for text and buttons
    final textColor = Colors.black; // Change if needed
    final buttonColor = AppColors.customPink; // Change if needed

    return Card(
      color: backgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.title,
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 28),
                    minimumSize: Size.zero,
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeColumn(
                  title: 'From',
                  date: booking.fromDate,
                  time: booking.fromTime,
                  iconColor: buttonColor,
                  textColor: textColor,
                ),
                DateTimeColumn(
                  title: 'To',
                  date: booking.toDate,
                  time: booking.toTime,
                  iconColor: buttonColor,
                  textColor: textColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomElevatedButton(
                    text: 'Rate Us',
                    iconPath: 'assets/star.svg',
                    onPressed: () {
                      // Handle button press for Rate Us
                    },
                    backgroundColor: AppColors.customBlue,
                  ),
                  SizedBox(width: 8), // Add some spacing between buttons
                  CustomElevatedButton(
                    text: 'Geolocation',
                    iconPath: 'assets/pin.svg',
                    onPressed: () {
                      // Handle button press for Geolocation
                    },
                    backgroundColor: AppColors.customBlue,
                  ),
                  SizedBox(width: 8), // Add some spacing between buttons
                  CustomElevatedButton(
                    text: 'Surveillance',
                    iconPath: 'assets/radio.svg',
                    onPressed: () {
                      // Handle button press for Surveillance
                    },
                    backgroundColor: AppColors.customBlue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
