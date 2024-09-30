import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(44.0),
        const SettingsAppBar(),
        vGap(24.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(32.0.r),
          ),
          child: Column(
            children: [
              Text(
                'Edit Profile',
                style: AppTextStyles.font15WhiteW500,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
