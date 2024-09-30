import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';

class SettingsProfileAvatar extends StatelessWidget {
  const SettingsProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.0.w,
      height: 104.0.w,
      child: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.profileAvatar,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0.r),
              child: Image.asset(
                // add picked image here
                AppAssets.avatarTest,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                //Open image picker
              },
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 18.0.r,
                child: Center(
                  child: Image.asset(
                    AppAssets.pencil,
                    width: 20.0.w,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
