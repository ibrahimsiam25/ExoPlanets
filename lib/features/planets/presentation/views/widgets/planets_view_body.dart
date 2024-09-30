import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/features/planets/presentation/planets%20cubit/planets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void _nextPage() {
    _pageController.animateToPage(
      context.read<PlanetsCubit>().currentIndex,
      duration: const Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: context.height * (500 / 812),
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
                vGap(30),
                const CustomRichText(),
                vGap(30),
                BlocBuilder<PlanetsCubit, PlanetsState>(
                  builder: (context, state) {
                    return PlanetInfoCard(
                      title:
                          planetData[context.read<PlanetsCubit>().currentIndex]
                              .title,
                      subtitle:
                          planetData[context.read<PlanetsCubit>().currentIndex]
                              .subtitle,
                    );
                  },
                ),
              ],
            ),
          ),
          // Positioned arrow image
          Positioned(
            left: context.width * 0.27,
            top: context.height * 0.4,
            child: Image.asset(AppAssets.anArrowPointingAtAPlanet),
          ),
          // Positioned PageView with defined size
          Positioned(
            top: context.height * 0.23,
            left: context.width * 0.45,
            child: SizedBox(
              height: context.height * 0.65,
              width: context.width * 0.5,
              child: PlanetsPageView(
                onPageChanged: (p0) {
                  context.read<PlanetsCubit>().changePage(p0);
                },
                planetTwoClick: () {
                  _nextPage();
                },
                pageController: _pageController,
                angle: 50,
                width: context.width * 0.5,
                height: context.height * 0.18,
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
              width: MediaQuery.of(context).size.width - 100,
              child: CustomTextButton(
                  text: "Explore planet",
                  onTap: () {},
                  style: AppTextStyles.font20WhiteW500),
            ),
          ),
        ],
      ),
    );
  }
}
