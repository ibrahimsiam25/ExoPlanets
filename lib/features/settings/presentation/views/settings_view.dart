import 'package:flutter/material.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundImage: AppAssets.spaceBackGround,
      body: SettingsViewBody(),
    );
  }
}
