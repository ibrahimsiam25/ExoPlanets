import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/features/leadersboard/presentation/widgets/not_top_3_player.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/user_model.dart';

class CustomResetOfTopPlayersList extends StatelessWidget {
  final List<UserModel> restOfTopPlayers;
  const CustomResetOfTopPlayersList(
      {super.key, required this.restOfTopPlayers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return NotTop3Player(user: restOfTopPlayers[index], index: index);
          },
          separatorBuilder: (context, index) => vGap(16),
          itemCount: restOfTopPlayers.length),
    );
  }
}
