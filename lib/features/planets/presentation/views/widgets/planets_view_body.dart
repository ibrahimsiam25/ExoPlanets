import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import 'package:exo_planets/core/widgets/custom_app_bar.dart';
import 'package:exo_planets/core/static/static_planet_data.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/Planet_info_card.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/custom_rich_text.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/planets_page_view.dart';




class PlanetsViewBody extends StatefulWidget {
  const PlanetsViewBody({super.key});

  @override
  State<PlanetsViewBody> createState() => _PlanetsViewBodyState();
}

class _PlanetsViewBodyState extends State<PlanetsViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
void _nextPage() {
  if (_currentPage < planetData.length - 1) {
    _currentPage++;

   
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 700), 
      curve: Curves.fastOutSlowIn, 
    );

    setState(() {});
  }
}

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
               PlanetInfoCard(
                  title:planetData[_currentPage].title,
                  subtitle: planetData[_currentPage].subtitle,
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
              height: 620.h,
              width: 200.w,
              child: PlanetsPageView(
                planetTwoClick: () {
                  _nextPage();
                },
                pageController: _pageController,
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
              Positioned(
                top: 610.h,
                left: 50,
                child: SizedBox(
                  height: 50.h,
                  width:  MediaQuery.of(context).size.width -100,
                  child: CustomTextButton(
                    text: "Explore planet",
                    onTap: () {
                     
                    },
                    style: AppTextStyles.font20WhiteW500
                        ),
                ),
              ),
        ],
      ),
    );
  }
}
