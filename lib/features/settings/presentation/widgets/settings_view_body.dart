import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/features/settings/presentation/widgets/edit_profile_card.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_app_bar.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_element.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_assets.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(44.0),
        const SettingsAppBar(),
        vGap(24.0),
        const EditProfileCard(),
        vGap(12.0),
        const SettingsElement(
          image: AppAssets.prefs,
          title: 'App preferences',
        ),
        vGap(12.0),
        const SettingsElement(
          image: AppAssets.help,
          title: 'Help and Support',
        ),
        vGap(12.0),
        const SettingsElement(
          image: AppAssets.feed,
          title: 'Give a feedback',
        ),
        vGap(12.0),
        const SettingsElement(
          image: AppAssets.logout,
          title: 'Logout',
          color: AppColors.lightRed,
        ),
      ],
    );
  }
}
