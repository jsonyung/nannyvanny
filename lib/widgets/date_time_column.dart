import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateTimeColumn extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final Color iconColor;
  final Color textColor;

  const DateTimeColumn({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/calendar.svg',
              height: 16,
              width: 16,
              color: iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/clock.svg',
              height: 16,
              width: 16,
              color: iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              time.toLowerCase(),
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
