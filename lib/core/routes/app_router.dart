import 'package:flutter/material.dart';
import 'package:exo_planets/core/model/planet_model.dart';
import '../../features/quiz/presentation/views/quiz_view.dart';
import '../../features/planets/presentation/views/explore_planet_view.dart';
import 'package:exo_planets/features/auth/presentation/views/auth_view.dart';
import 'package:exo_planets/features/home/presentation/views/home_view.dart';
import 'package:exo_planets/features/auth/presentation/views/log_in_view.dart';
import 'package:exo_planets/features/auth/presentation/views/sign_up_view.dart';
import 'package:exo_planets/features/splash/presentation/views/splash_view.dart';
import 'package:exo_planets/features/quiz/presentation/views/quiz_result_view.dart';
import 'package:exo_planets/features/home/presentation/widgets/bottom_nav_bart.dart';
import 'package:exo_planets/features/auth/presentation/views/forgot_password_view.dart';
import 'package:exo_planets/features/onboarding/presentation/views/onboarding_view.dart';


class AppRouter {
  static const String onboarding = '/onboarding';
  static const String splash = '/';
  static const String home = '/home';
  static const String auth = '/auth';
  static const String logIn = '/logIn';
  static const String signUp = '/signUp';
  static const String quiz = '/quiz';
  static const String quizResult = '/quizResult';
  static const String explorePlanetView = '/explorePlanetView';
  static const String forgotPassword = '/forgotPassword';
  static const String bottomNavigationBar = '/bottomNavigationBar';
 
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _viewMaterialRoute(view: const SplashView());
      case onboarding:
        return _viewMaterialRoute(view: const OnboardingView());
      case auth:
        return _viewMaterialRoute(view: const AuthView());
      case logIn:
        return _viewMaterialRoute(view: const LogInView());
      case signUp:
        return _viewMaterialRoute(view: const SignUpView());
      case forgotPassword:
        return _viewMaterialRoute(view: const ForgotPasswordView());
      case bottomNavigationBar:
        return _viewMaterialRoute(view: const BottomNavBarController());
      case home:
        return _viewMaterialRoute(view: const HomeView());
      case quiz:
        return _viewMaterialRoute(view: const QuizView());
      case quizResult:
        return _viewMaterialRoute(view: const QuizResultView());
      case explorePlanetView:
       final planetModel = settings.arguments as PlanetModel;
        return _viewMaterialRoute(view:  ExplorePlanetView(planetModel: planetModel));  
      default:
        return null;
    }
  }

  static MaterialPageRoute<dynamic> _viewMaterialRoute(
      {required Widget view, Object? arguments}) {
    return MaterialPageRoute(
        builder: (context) => view,
        settings: RouteSettings(arguments: arguments));
  }
}
