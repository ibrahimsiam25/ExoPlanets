import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_assets.dart';

class QuizViewsBackground extends StatelessWidget {
  final Widget child;
  const QuizViewsBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.earthImage,
          height: context.height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: child)
      ],
    );
  }
}
