import 'dart:developer';

import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/model/user_model.dart';
import 'package:exo_planets/features/leadersboard/presentation/view%20models/leadersboard%20cubit/leadersboard_cubit.dart';
import 'package:exo_planets/features/leadersboard/presentation/widgets/custom_top_three_container.dart';
import 'package:exo_planets/features/leadersboard/presentation/widgets/leaders_board_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_reset_of_top_players.dart';

class LeadersboardViewBody extends StatelessWidget {
  const LeadersboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LeadersBoardHeader(),
          Expanded(
            child: StreamBuilder<List<UserModel>?>(
                stream: context.read<LeadersboardCubit>().getLeaders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    log(snapshot.error.toString());
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  } else if (snapshot.hasData && snapshot.data!.length >= 3) {
                    return Column(
                      children: [
                        CustomTopThreeContainer(
                          top3Users: snapshot.data!.sublist(0, 3),
                        ),
                        vGap(16),
                        CustomResetOfTopPlayersList(
                          restOfTopPlayers: snapshot.data!.length <= 8
                              ? snapshot.data!.sublist(3)
                              : snapshot.data!.sublist(3, 8),
                        )
                      ],
                    );
                  } else {
                    return const Text('Something went dsdda');
                  }
                }),
          ),
        ],
      ),
    );
  }
}
