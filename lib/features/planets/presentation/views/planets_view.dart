import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/planets_view_body.dart';
import 'package:exo_planets/features/planets/presentation/manager/planets%20cubit/planets_cubit.dart';

class PlanetsView extends StatelessWidget {
  const PlanetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundImage: AppAssets.spaceBackGround,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => PlanetsCubit(),
        child: const PlanetsViewBody(),
      )),
    );
  }
}
