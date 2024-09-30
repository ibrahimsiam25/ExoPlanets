import 'package:flutter/material.dart';
import '../../../../core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/planets_view_body.dart';


class PlanetsView extends StatelessWidget {
  const PlanetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundImage: AppAssets.spaceBackGround,
      body: SafeArea(child: PlanetsViewBody()),
    );
  }
}