import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/routes/app_router.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/features/settings/presentation/widgets/edit_profile_card.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_app_bar.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_element.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_assets.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(44.h),
        const SettingsAppBar(),
        vGap(24.h),
        Expanded(
            child: ListView(
          children: [
            const EditProfileCard(),
            vGap(12.h),
            SettingsElement(
              image: AppAssets.prefs,
              title: 'App preferences',
              onTap: () {},
            ),
            vGap(12.h),
            SettingsElement(
              image: AppAssets.help,
              title: 'Help and Support',
              onTap: () {},
            ),
            vGap(12.h),
            SettingsElement(
              image: AppAssets.feed,
              title: 'Give a feedback',
              onTap: () {},
            ),
            vGap(12.h),
            SettingsElement(
              image: AppAssets.logout,
              title: 'Logout',
              gradient: Constants.customRedGradient,
              color: AppColors.lightRed,
              onTap: () {
                getIt.get<FirebaseAuth>().signOut();
                context.pushNamedAndRemoveUntil(AppRouter.auth,
                    predicate: (_) => false);
              },
            ),
            vGap(20.h)
          ],
        )),
      ],
    );
  }
}
