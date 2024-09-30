import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class PlanetInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const PlanetInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 80.0.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundOfContianer, // Dark background color for the card
        borderRadius: BorderRadius.circular(16), // Rounded corners
        border: Border.all(color: AppColors.white, width: 1.5), // White border
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.font27LightGreyW600
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTextStyles.font12LightGrayW400
          ),
        ],
      ),
    );
  }
}