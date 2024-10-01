import 'package:flutter/material.dart';
import '../../../../../../core/helpers/app_assets.dart';
import '../../../../../../core/model/planet_model.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';

class CustomExploreAppBar extends StatelessWidget {
  const CustomExploreAppBar({
    super.key,
    required this.planetModel,
  });

  final PlanetModel planetModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 10,
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.backIcon),
        ),
        title: Text(
          "Our Home",
          style: AppTextStyles.font27LightGreyW600.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          planetModel.title,
          style: AppTextStyles.font27LightGreyW600,
        ),
      ),
    );
  }
}
