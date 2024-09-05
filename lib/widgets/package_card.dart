import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nannyvanny/values/app_color.dart';

import '../model/package_model.dart';

class PackageCard extends StatelessWidget {
  final Package package;
  final int index;

  const PackageCard({super.key, required this.package, required this.index});

  @override
  Widget build(BuildContext context) {
    // Determine the background color and other styles based on the index
    final isEvenIndex = index.isEven;
    final backgroundColor = isEvenIndex
        ? AppColors.customLightPink
        : AppColors.customSuperLightBlue;
    final buttonColor =
        isEvenIndex ? AppColors.customPink : AppColors.customLightBlue;
    final svgColor = isEvenIndex ? AppColors.customPink : Colors.white;
    final descriptionColor = isEvenIndex ? Colors.black : Colors.white;

    // Determine the SVG icon and number
    String svgAsset = 'assets/cal_blank.svg';
    String number = '';
    if (package.title == 'One Day Package') {
      number = '01';
    } else if (package.title == 'Two Day Package') {
      number = '02';
    } else if (package.title == 'Three Day Package') {
      number = '03';
    } else if (package.title == 'Four Day Package') {
      number = '04';
    } else if (package.title == 'Five Day Package') {
      number = '05';
    } else if (package.title == 'Six Day Package') {
      number = '06';
    } else if (package.title == 'Weekend Day Package') {
      svgAsset = 'assets/cal_week.svg';
      number = ''; // No number for Weekend Day Package
    }

    return Card(
      color: backgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      svgAsset,
                      color: svgColor,
                      width: 30, // Adjust size as needed
                      height: 30,
                    ),
                    if (number.isNotEmpty)
                      Text(
                        number,
                        style: TextStyle(
                          color: svgColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
                // const SizedBox(width: 20),
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
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  package.title,
                  style: const TextStyle(
                    color: AppColors.customBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '₹${package.price}', // Use Indian Rupee symbol
                  style: const TextStyle(
                    color: AppColors.customBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              package.description,
              style: TextStyle(
                color: descriptionColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
