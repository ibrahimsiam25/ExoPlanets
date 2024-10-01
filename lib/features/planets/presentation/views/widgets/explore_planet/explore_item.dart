import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/model/explore_model.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';

class ExploreItem extends StatelessWidget {
  final ExploreInfoModel explore;

  const ExploreItem(this.explore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            explore.title,
            style: AppTextStyles.font32RedW600,
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: _highlightText(explore.description),
            ),
          )
        ],
      ),
    );
  }

  List<TextSpan> _highlightText(String description) {
    const phrasesToHighlight = [
      "4 light-years",
      "habitable zone",
      "atmospheric loss",
      "11 days",
      "1.3 times",
    ];

    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final phrase in phrasesToHighlight) {
      final regex = RegExp(RegExp.escape(phrase));
      final matches = regex.allMatches(description);

      for (final match in matches) {
        // Add text before the match
        if (lastMatchEnd < match.start) {
          spans.add(TextSpan(
            text: description.substring(lastMatchEnd, match.start),
            style: AppTextStyles.font16RedW500.copyWith(color: AppColors.white),
          ));
        }

        // Add the highlighted matched phrase
        spans.add(
          TextSpan(
            text: match.group(0),
            style: AppTextStyles.font16RedW500,
          ),
        );

        // Update the end of the last match
        lastMatchEnd = match.end;
      }
    }

    // Add any remaining text after the last match
    if (lastMatchEnd < description.length) {
      spans.add(TextSpan(
        text: description.substring(lastMatchEnd),
        style: const TextStyle(color: AppColors.white, fontSize: 16),
      ));
    }

    return spans;
  }
}
