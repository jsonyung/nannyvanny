// lib/widgets/custom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../values/app_color.dart';

class CustomNavBar extends StatelessWidget {
  final NavBarConfig navBarConfig;

  const CustomNavBar({super.key, required this.navBarConfig});

  Widget _buildItem(ItemConfig item, bool isSelected) {
    final title = item.title;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: IconTheme(
            data: IconThemeData(
              size: item.iconSize,
              color: isSelected ? AppColors.customPink : Colors.grey,
            ),
            child: item.icon,
          ),
        ),
        if (title != null)
          Padding(
            padding: EdgeInsets.only(
              top: 2.0,
              bottom: isSelected ? 0 : 8,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Text(
                  title,
                  style: item.textStyle.apply(
                    color: isSelected
                        ? AppColors.customPink
                        : item.inactiveForegroundColor,
                  ),
                ),
              ),
            ),
          ),
        if (isSelected)
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            height: 5,
            width: 5,
            decoration: const BoxDecoration(
              color: AppColors.customPink,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navBarConfig.navBarHeight,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final (index, item) in navBarConfig.items.indexed)
            Expanded(
              child: InkWell(
                onTap: () => navBarConfig.onItemSelected(index),
                child: _buildItem(item, navBarConfig.selectedIndex == index),
              ),
            ),
        ],
      ),
    );
  }
}
