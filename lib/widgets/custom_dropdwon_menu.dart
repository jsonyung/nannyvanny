import 'package:flutter/material.dart';

import '../values/app_color.dart';

class DropdownMenuWidget extends StatelessWidget {
  final String hintText;
  final Stream<String?> selectedValueStream;
  final List<String> items;
  final ValueChanged<String?>? onChanged; // Update type here

  const DropdownMenuWidget({
    super.key,
    required this.hintText,
    required this.selectedValueStream,
    required this.items,
    this.onChanged, // Change to nullable if needed
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: selectedValueStream,
      builder: (context, snapshot) {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 20.0),
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          value: snapshot.data,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          icon: const Padding(
            padding: EdgeInsets.only(right: 0),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.customPink, // Use your custom color here
            ),
          ),
        );
      },
    );
  }
}
