import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?>? onChanged; // Update type here
  final double radioSize;
  final double textSize;
  final String text;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged, // Update type here
    required this.text,
    this.radioSize = 24.0, // Default radio button size
    this.textSize = 16.0, // Default text size
  });

  CustomRadioButton copyWith({
    int? value,
    int? groupValue,
    ValueChanged<int?>? onChanged,
    double? radioSize,
    double? textSize,
    String? text,
  }) {
    return CustomRadioButton(
      value: value ?? this.value,
      groupValue: groupValue ?? this.groupValue,
      onChanged: onChanged ?? this.onChanged,
      text: text ?? this.text,
      radioSize: radioSize ?? this.radioSize,
      textSize: textSize ?? this.textSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value); // Safely call onChanged
        }
      },
      child: Row(
        children: [
          SizedBox(
            width: radioSize,
            height: radioSize,
            child: Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              // Ensure this matches expected type
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          ),
          const SizedBox(width: 2.0), // Space between radio button and text
          Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
