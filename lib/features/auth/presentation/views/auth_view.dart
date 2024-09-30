import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppAssets.signInUpBackground), context);
    return CustomScaffold(
      height: context.height,
      backgroundImage: AppAssets.authBackground,
      body: const AuthViewBody(),
    );
  }
}
