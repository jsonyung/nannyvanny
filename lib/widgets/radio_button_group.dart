import 'package:flutter/material.dart';

import 'custom_radio_button.dart';

class RadioButtonGroup extends StatelessWidget {
  final int selectedValue;
  final ValueChanged<int?>? onChanged; // Update type here
  final List<CustomRadioButton> buttons;

  const RadioButtonGroup({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons.map((button) {
        return button.copyWith(
          groupValue: selectedValue,
          onChanged: onChanged, // Ensure this matches expected type
        );
      }).toList(),
    );
  }
}
