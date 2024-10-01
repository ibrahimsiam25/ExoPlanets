import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/features/leadersboard/presentation/widgets/custom_top_three_container.dart';
import 'package:exo_planets/features/leadersboard/presentation/widgets/leaders_board_header.dart';
import 'package:flutter/material.dart';
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
          const CustomTopThreeContainer(),
          vGap(16),
          const CustomResetOfTopPlayersList()
        ],
      ),
    );
  }
}
