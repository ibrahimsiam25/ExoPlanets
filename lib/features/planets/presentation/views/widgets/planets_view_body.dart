import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exo_planets/core/widgets/custom_app_bar.dart';
import 'package:exo_planets/core/static/static_planet_data.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/Planet_info_card.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/custom_rich_text.dart';
class PlanetsViewBody extends StatelessWidget {
  const PlanetsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity, 
      child: Stack(
        children: [
       
          Positioned(
            top: 520.h,
            child: SizedBox(
              width: MediaQuery.of(context).size.width, 
              child: Image.asset(
                AppAssets.halfCircle,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              children: [
                vGap(15),
                const CustomAppBar(),
                vGap(18),
                Text(
                  "Enjoy the amazing world beyond our solar system!",
                  style: AppTextStyles.font14GreyW400,
                ),
                vGap(10),
                const CustomRichText(),
                vGap(12),
                const PlanetInfoCard(
                  title: 'Proxima b',
                  subtitle: 'Potentially habitable',
                ),
              ],
            ),
          ),
          // Positioned arrow image
          Positioned(
            left: 100.w,
            top: 320.h,
            child: Image.asset(AppAssets.anArrowPointingAtAPlanet),
          ),
          // Positioned PageView with defined size
          Positioned(
            top: 180.h,
            left: 140.w,
            child: SizedBox(
              height:620.h,
              width: 200.w,
              child: PlanetsPageView(
                planetTwoClick: () {},
                angle: 60,
                width: 150.w,
                height: 150.h,
                imagePaths: [
                  planetData[0].image,
                  planetData[1].image,
                  planetData[2].image,
                  planetData[3].image,
                  planetData[4].image,
                  planetData[5].image,
                  planetData[6].image,
                  planetData[7].image,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class PlanetsPageView extends StatelessWidget {
  final List<String> imagePaths;
  final double width ;
  final double height;
  final int angle;
 final VoidCallback planetTwoClick;   
  const PlanetsPageView({
    super.key,
    required this.imagePaths, required this.width, required this.height, required this.angle, required this.planetTwoClick, // Pass list of image asset paths
   
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * 3.141592653589793 / 180, 
      child: PageView.builder(
        itemCount: imagePaths.length, 
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePaths[index+2],
                width: width-56,
                height: height-56,
              ),
             
              GestureDetector(
                onTap: planetTwoClick,
                child: Image.asset(
                  imagePaths[index+1],
                    width: width-33,
                  height: height-33,
                ),
              ), 
              Image.asset(
                imagePaths[index],
                width: width,
                height: height,
              ),
            ],
          );
        },
      ),
    );
  }
}