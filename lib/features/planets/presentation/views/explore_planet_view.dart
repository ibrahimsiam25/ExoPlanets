import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/helpers/app_assets.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/model/planet_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/explore_planet/explore_planet_view_body.dart';

class ExplorePlanetView extends StatelessWidget {
  const ExplorePlanetView({super.key, required this.planetModel});
  final PlanetModel planetModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyofBackgroundForExplaroe,
      body: ExplorePlanetViewBody(
        planetModel: planetModel,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 18.0,right: 18.0,bottom: 18.0),
        height: 70.h,
        child: CustomButton(
            text: "View in VR",
            onTap: () {
              context.pushNamed(AppRouter.viewInVrView,
                  arguments: planetModel.model3DPath);
            },
            icon: SvgPicture.asset(AppAssets.viewInVR)),
      ),
    );
  }
}
