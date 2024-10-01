import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import '../../../../../../core/helpers/app_assets.dart';
import '../../../../../../core/model/planet_model.dart';
import 'package:exo_planets/core/routes/app_router.dart';
import '../../../../../../core/helpers/url_luncher.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/widgets/custom_button.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/explore_planet/explore_item.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/explore_planet/custom_explore_app_bar.dart';

class ExplorePlanetViewBody extends StatelessWidget {
  const ExplorePlanetViewBody({super.key, required this.planetModel});
  final PlanetModel planetModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                planetModel.imageForExplore,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              vGap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Watch this video",
                          style: AppTextStyles.font32RedW600),
                    ),
                    vGap(5),
                    GestureDetector(
                      onTap: () {
                               launchCustomUr(context,
                                   planetModel.youtubeLink);
                      },
                      child: Image.asset(
                        width: double.infinity,
                        fit: BoxFit.fill,
                        planetModel.imageForYoutube,
                      ),
                    ),
                    vGap(16),
                    // Remove SizedBox and directly use ListView.builder
                    ListView.builder(
                      shrinkWrap: true, // Enable shrink wrapping
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: planetModel.exploreInfoList.length,
                      itemBuilder: (context, index) {
                        return ExploreItem(planetModel.exploreInfoList[index]);
                      },
                    ),
  
   
                    vGap(48),
                  ],
                ),
              ),
            ],
          ),
          CustomExploreAppBar(planetModel: planetModel),
        ],
      ),
    );
  }
}
