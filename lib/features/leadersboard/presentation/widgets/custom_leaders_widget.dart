import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/network_image_helper.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/model/user_model.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_text_styles.dart';

class CustomLeadersWidget extends StatelessWidget {
  final int index;
  final List<UserModel> top3Users;
  const CustomLeadersWidget(
      {super.key, required this.index, required this.top3Users});

  @override
  Widget build(BuildContext context) {
    String? user1ImageUrl = top3Users[0].imageUrl;
    String? user2ImageUrl = top3Users[1].imageUrl;
    String? user3ImageUrl = top3Users[2].imageUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.white.withOpacity(0.1),
                radius: 43.r,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.white.withOpacity(0.1),
                  radius: 38.r,
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColors.white.withOpacity(0.1),
                radius: 33.r,
                backgroundImage: index == 1
                    ? networkImageHelper(user1ImageUrl)
                    : index == 0
                        ? networkImageHelper(user2ImageUrl)
                        : networkImageHelper(user3ImageUrl),
              ),
              index == 1
                  ? Positioned(
                      top: -10.h,
                      child: SvgPicture.asset(
                        AppAssets.crown,
                        height: 22.h,
                        width: 32.w,
                      ))
                  : const SizedBox.shrink(),
              Positioned(
                bottom: -8.h,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: AppColors.white,
                  child: Text(
                      index == 1
                          ? "1"
                          : index == 0
                              ? "2"
                              : "3",
                      style: AppTextStyles.font14BlackW500),
                ),
              )
            ],
          ),
        ),
        vGap(10),
        SizedBox(
          width: 90.w,
          child: Center(
            child: Text(
              index == 1
                  ? top3Users[0].name
                  : index == 0
                      ? top3Users[1].name
                      : top3Users[2].name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font15WhiteW600,
            ),
          ),
        ),
        SizedBox(
          width: 36.w,
          child: Divider(
            color: AppColors.white,
            thickness: 1,
            height: 20.h,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.rocket, height: 20.h, width: 20.w),
            hGap(5),
            Text(
              "${index == 1 ? top3Users[0].points.toString() : index == 0 ? top3Users[1].points.toString() : top3Users[2].points.toString()} pts",
              style: AppTextStyles.font12WhiteW600,
            )
          ],
        )
      ],
    );
  }
}
