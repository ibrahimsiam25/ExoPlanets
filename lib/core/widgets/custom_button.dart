import '../helpers/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? child;
  final TextStyle? style;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.style,
      this.child});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 13,
          color: AppColors.black.withOpacity(0.25),
        )
      ],
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: Constants.customRedGradient,
          ),
          alignment: Alignment.center,
          child: child ??
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: style ??
                        AppTextStyles.font21WhiteW500
                            .copyWith(letterSpacing: 1.5),
                  ),
                  hGap(10),
                  SvgPicture.asset(
                    AppAssets.arrowForward,
                    width: 22.w,
                    height: 14.h,
                  )
                ],
              ),
        ),
      ),
    );
  }
}
