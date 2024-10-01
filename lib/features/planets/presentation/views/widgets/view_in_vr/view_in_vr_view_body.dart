import 'package:flutter/material.dart';
import '../../../../../../core/helpers/spacing.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/view_in_vr/custom_vr_app_bar.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/view_in_vr/custom_planet_view_in_vr.dart';


class ViewInVrViewBody extends StatelessWidget {
  const ViewInVrViewBody({super.key, required this.planet3dModelPath});
final String planet3dModelPath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  vGap(130),
                  CustomPlanetViewInVR(
                    planet3dModelPath: planet3dModelPath,
                  ),
                  vGap(40),
                  CustomPlanetViewInVR(
                    planet3dModelPath: planet3dModelPath,
                  )
                ],
              ),
            ),
          ],
        ),
        const CustomVRAppBar(),
      ],
    );
  }
}