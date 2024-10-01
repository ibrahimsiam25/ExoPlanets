import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import '../../../../../../core/helpers/app_assets.dart';
import '../../../../../../core/model/planet_model.dart';
import '../../../../../../core/model/explore_model.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';



class ExplorePlanetViewBody extends StatelessWidget {
  const ExplorePlanetViewBody({super.key, required this.planetModel});
final PlanetModel  planetModel;
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
                      child: Text("Watch this video",style: AppTextStyles.font32RedW600)),
                 vGap(5),
                 Image.asset(
                  width: double.infinity,
                   fit: BoxFit.fill,
                  planetModel.imageForYoutube,
                 ),
                    vGap(16),ListView.builder(
physics: const NeverScrollableScrollPhysics(),
      itemCount: planetModel.exploreInfoList.length,
      itemBuilder: (context, index) {
        return ExploreItem(planetModel.exploreInfoList[index]);
      },
    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: ListTile(
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppAssets.backIcon)),
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
          )
        ],
      ),
    );
  }
}



class ExploreItem extends StatelessWidget {
  final ExploreInfoModel explore;

  const ExploreItem(this.explore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          explore.title,
          style: AppTextStyles.font32RedW600,
        ),
       vGap(10),
        Text.rich(
          TextSpan(
            children: highlightText(explore.description),
          ),
        ),
      ],
    );
  }
}

 List<TextSpan> highlightText(String description) {
    List<String> wordsToHighlight = [
      "40 light-years",
      "habitable zone",
      "James Webb Space Telescope",
      "11 days",
      "500 light-years",
      "cosmic collisions",
      "Kepler Space Telescope",
    ];

    List<TextSpan> spans = [];
    description.split(' ').forEach((word) {
      Color color = AppColors.white; 
      if (wordsToHighlight.contains(word)) {
        color = AppColors.lightRed; 
      }
      spans.add(TextSpan(
        text: word + ' ',
        style: TextStyle(color: color, fontSize: 16),
      ));
    });

    return spans;
  }
