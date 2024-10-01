import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LeadersBoardHeader extends StatelessWidget {
  const LeadersBoardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        vGap(16),
        const CustomAppBar(),
        vGap(16),
        RichText(
          text: TextSpan(
              text: "Leaders",
              style: AppTextStyles.font30WhiteW700
                  .copyWith(color: AppColors.darkerRed),
              children: [
                TextSpan(text: "board", style: AppTextStyles.font30WhiteW700)
              ]),
        ),
        vGap(8),
        Text(
          "Top Performers",
          style: AppTextStyles.font17GreyW500,
        ),
        vGap(10),
      ],
    );
  }
}
