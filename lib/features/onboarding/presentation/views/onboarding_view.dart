import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/onboarding/presentation/ui%20cubit/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      height: context.height,
      body: BlocProvider(
        create: (context) => OnboardingCubit(),
        child: const OnboardingViewBody(),
      ),
    );
  }
}
