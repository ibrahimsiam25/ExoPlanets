import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/features/leadersboard/presentation/widgets/not_top_3_player.dart';
import 'package:flutter/material.dart';

class CustomResetOfTopPlayersList extends StatelessWidget {
  const CustomResetOfTopPlayersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return const NotTop3Player();
          },
          separatorBuilder: (context, index) => vGap(16),
          itemCount: 3),
    );
  }
}
