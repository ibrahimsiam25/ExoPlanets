import '../helpers/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/widgets/inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? child;
  final TextStyle? style;
  const CustomTextButton(
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
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: Constants.customRedGradient,
          ),
          alignment: Alignment.center,
          child: Center(
            child: Text(text, style: style),
          ),
        ),
      ),
    );
  }
}
