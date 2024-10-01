import 'package:exo_planets/features/leadersboard/presentation/views/leadersboard_view.dart';
import 'package:flutter/material.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/ui model/on_boarding_item.dart';
import 'package:exo_planets/features/planets/presentation/views/planets_view.dart';
import 'package:exo_planets/features/quiz/presentation/views/select_quiz_view.dart';
import 'package:exo_planets/features/settings/presentation/views/settings_view.dart';

class Constants {
  const Constants._();

  static const List<String> onBoardingBachground = [
    AppAssets.onboardingFirst,
    AppAssets.onboardingSecond,
    AppAssets.onboardingThird,
    AppAssets.onboardingFourth
  ];
  static const LinearGradient customRedGradient = LinearGradient(
      colors: [
        AppColors.lightRed,
        AppColors.darkerRed,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 1]);
  static const LinearGradient customGreenGradient = LinearGradient(
      colors: [
        AppColors.lighterGreen,
        AppColors.darkerGreen,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 1]);
  static List<OnBoardingItem> onBoardingItems = [
    OnBoardingItem(
        description:
            "Engage with interactive tools to visualize and understand the uniqueness of each exoplanet.",
        backgroundImage: AppAssets.onboardingFirst,
        richText: RichText(
            text: TextSpan(
                text: "Discover ",
                style: AppTextStyles.font50WhiteW600
                    .copyWith(color: AppColors.lightRed),
                children: [
              TextSpan(text: "New Worlds", style: AppTextStyles.font50WhiteW600)
            ]))),
    OnBoardingItem(
        description:
            "Engage with interactive tools to visualize and understand the uniqueness of each exoplanet.",
        backgroundImage: AppAssets.onboardingSecond,
        richText: RichText(
            text: TextSpan(
                text: "Inter",
                style: AppTextStyles.font50WhiteW600,
                children: [
              TextSpan(
                  text: "active ",
                  style: AppTextStyles.font50WhiteW600
                      .copyWith(color: AppColors.lightRed)),
              TextSpan(text: "Learning", style: AppTextStyles.font50WhiteW600)
            ]))),
    OnBoardingItem(
        description:
            "Test your knowledge with quizzes and games designed to expand your understanding of the universe.",
        backgroundImage: AppAssets.onboardingThird,
        richText: RichText(
            text: TextSpan(
                text: "Fun     ",
                style: AppTextStyles.font50WhiteW600
                    .copyWith(color: AppColors.lightRed),
                children: [
              TextSpan(text: "Challenges", style: AppTextStyles.font50WhiteW600)
            ]))),
    OnBoardingItem(
        description:
            "Begin your journey into the mysteries of the cosmos and start exploring the wonders of exoplanets today!",
        backgroundImage: AppAssets.onboardingFourth,
        richText: RichText(
            text: TextSpan(
                text: "Get Ready ",
                style: AppTextStyles.font50WhiteW600
                    .copyWith(color: AppColors.lightRed),
                children: [
              TextSpan(
                  text: "for the Journey", style: AppTextStyles.font50WhiteW600)
            ]))),
  ];

  static const List<Widget> bottomNavBarViews = [
    HomeView(),
    PlanetsView(),
    SelectQuizView(),
    SettingsView(),
    LeadersboardView()
  ];

  static const List<String> images = [
    AppAssets.home,
    AppAssets.planets,
    AppAssets.quiz,
    AppAssets.settings,
  ];
  static const List<String> labels = [
    'Home',
    'Planets',
    'Quiz',
    'Settings',
  ];
  static const List<String> quizImages = [
    AppAssets.proximaQuiz,
    AppAssets.kepler452bQuiz,
    AppAssets.gliese581gQuiz,
    AppAssets.waspQuiz,
    AppAssets.cancri55Quiz,
    AppAssets.kepler22Quiz,
    AppAssets.erisQuiz,
    AppAssets.vestaQuiz
  ];
}
