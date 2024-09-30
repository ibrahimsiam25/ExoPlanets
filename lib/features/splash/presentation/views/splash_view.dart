import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppAssets.authBackground), context);
    return CustomScaffold(
      height: context.height,
      body: const SplashViewBody(),
      backgroundImage: AppAssets.splashBg,
    );
  }
}
