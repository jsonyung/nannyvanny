// lib/widgets/menu_header.dart
import 'package:flutter/material.dart';

import '../values/app_color.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.customPink,
              width: 1.0,
            ),
          ),
          child: const CircleAvatar(
            radius: 38,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Emily Cyrus',
          style: TextStyle(
            color: AppColors.customPink,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
