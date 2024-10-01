import 'onboarding_skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';



class OnBoardingPageBody extends StatelessWidget {
  final int index;
  const OnBoardingPageBody({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppAssets.authBackground), context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          vGap(36),
          const Align(
              alignment: Alignment.centerRight, child: OnBoardingSkipButton()),
          vGap(138),
          Constants.onBoardingItems[index].richText,
          vGap(32),
          Text(
            Constants.onBoardingItems[index].description,
            style: AppTextStyles.font26WhiteW600,
          ),
          vGap(113.h),
          index == 3
              ? CustomButton(
                icon:    SvgPicture.asset(
                    AppAssets.arrowForward,
                    width: 22.w,
                    height: 14.h,
                  ),
                  text: "Get Started",
                  onTap: () {
                    context.pushNamedAndRemoveUntil(AppRouter.auth,
                        predicate: (_) => false);
                    SharedPrefHelper.setData("isOnBoardingViewed", true);
                  },
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
