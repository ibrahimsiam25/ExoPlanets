import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/core%20cubits/cubit/get_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundImage: AppAssets.spaceBackGround,
      body: BlocProvider(
        create: (context) => getIt<UserDataCubit>()..getUserData(),
        child: const SettingsViewBody(),
      ),
    );
  }
}
