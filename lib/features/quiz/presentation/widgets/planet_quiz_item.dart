import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_router.dart';

class PlanetQuizItem extends StatelessWidget {
  final int index;
  const PlanetQuizItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.pushNamed(
            AppRouter.quiz,
          );
        },
        child: Image.asset(
          Constants.quizImages[index],
          width: double.infinity,
          height: 180.h,
        ));
  }
}
