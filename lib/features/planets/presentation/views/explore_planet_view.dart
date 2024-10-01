import 'package:flutter/material.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/model/planet_model.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/explore_planet/explore_planet_view_body.dart';

class ExplorePlanetView extends StatelessWidget {
  const ExplorePlanetView({super.key, required this.planetModel});
 final PlanetModel planetModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   backgroundColor: AppColors.greyofBackgroundForExplaroe,
     
      body:  ExplorePlanetViewBody(planetModel: planetModel,),
    );
  }
}