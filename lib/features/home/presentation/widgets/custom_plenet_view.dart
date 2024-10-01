import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exo_planets/core/static/static_planet_data.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class CustomPlanetView extends StatelessWidget {
  final PageController pageController;

  const CustomPlanetView({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Center(
            child: SizedBox(
              width: 260.w,
              height: 240.h,
              child: Image.asset(fit: BoxFit.fill, AppAssets.circleOfPlent),
            ),
          ),
        ),
        SizedBox(
          height: 170.h,
          child: AspectRatio(
            aspectRatio: 1,
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: planetData.length,
              itemBuilder: (context, index) {
                return Flutter3DViewer(
                  progressBarColor: AppColors.grey,
                  src: planetData[index].model3DPath,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
