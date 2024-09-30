import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        hGap(44.0),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 28.0.r,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App',
              style: AppTextStyles.font15WhiteW500,
            ),
            Text(
              'Settings',
              style: AppTextStyles.font26WhiteW600,
            ),
          ],
        )
      ],
    );
  }
}
