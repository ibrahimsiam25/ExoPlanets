import 'package:flutter/material.dart';
import 'widgets/view_in_vr/view_in_vr_view_body.dart';
import 'package:exo_planets/core/theme/app_colors.dart';


class ViewInVrView extends StatelessWidget {
  const ViewInVrView({super.key, required this.planet3dModelPath});
final String planet3dModelPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyofBackgroundForExplaroe,
      body: ViewInVrViewBody(planet3dModelPath: planet3dModelPath),
    );
  }
}