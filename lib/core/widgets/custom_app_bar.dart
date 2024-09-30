import '../helpers/spacing.dart';
import '../theme/app_colors.dart';
import '../helpers/app_assets.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 46,
        decoration: const BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
           const Spacer(
              flex: 3,
            ),
            Image.asset(
              AppAssets.appBarLogo,
            ),
            hGap(20),
          const  Spacer(
              flex: 1,
            ),
            ClipOval(
              child: Image.asset(
                AppAssets.appBarProfile,
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }
}
