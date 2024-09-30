import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.font22WhiteW600, // Base style
        children: const <TextSpan>[
          TextSpan(text: 'Do you want to '),
          TextSpan(
            text: 'ex',
            style: TextStyle(color: AppColors.lightRed), // Highlighted part
          ),
          TextSpan(text: 'pl'),
          TextSpan(
            text: 'o',
            style: TextStyle(color: AppColors.lightRed), // Highlighted part
          ),
          TextSpan(text: 're'),
          TextSpan(text: ' \nthis '),
          TextSpan(
            text: 'planet',
            style: TextStyle(color: AppColors.lightRed), // Highlighted part
          ),
          TextSpan(text: '?'),
        ],
      ),
    );
  }
}
