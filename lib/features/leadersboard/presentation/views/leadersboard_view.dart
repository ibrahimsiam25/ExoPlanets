import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/leadersboard_view_body.dart';

class LeadersboardView extends StatelessWidget {
  const LeadersboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundImage: AppAssets.spaceBackGround,
      body: LeadersboardViewBody(),
    );
  }
}
