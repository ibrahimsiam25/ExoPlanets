import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/leadersboard/presentation/view%20models/leadersboard%20cubit/leadersboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/leadersboard_view_body.dart';

class LeadersboardView extends StatelessWidget {
  const LeadersboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundImage: AppAssets.spaceBackGround,
      body: BlocProvider(
        create: (context) => getIt<LeadersboardCubit>(),
        child: const LeadersboardViewBody(),
      ),
    );
  }
}
