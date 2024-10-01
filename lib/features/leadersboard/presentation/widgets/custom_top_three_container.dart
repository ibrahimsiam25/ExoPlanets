import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'custom_leaders_widget.dart';

class CustomTopThreeContainer extends StatelessWidget {
  const CustomTopThreeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 22.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          31.r,
        ),
        color: AppColors.selectedAnswerGrey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Text(
            "Top Space Voyager",
            style: AppTextStyles.font20WhiteW600,
          ),
          vGap(20),
          Center(
            child: SizedBox(
              height: context.height * 0.2,
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Transform.scale(
                      scale: index == 1 ? 1 : 0.8,
                      child: CustomLeadersWidget(index: index)),
                  separatorBuilder: (context, index) => hGap(16),
                  itemCount: 3),
            ),
          )
        ],
      ),
    );
  }
}
