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
      "similarities",
      "Earth",
      "older star",
      "1,400 ",
      "light-years",
      "yellow G-type star",
      "385 Earth ",
      "days",
      "liquid water could ",
      "60% larger than",
      "6 billion years old",
      "a runaway greenhouse effect",
      "hot to support life",
      "Hot Jupiter",
      "(1.1 days)",
      "egg",
      "10 million years",
      "super-Earth",
      "lava ",
      "stunning view",
      "Sun-like star",
      "2.4 times",
      "candidate",
      "2005",
      "25.9 hours",
      "557 Earth years",
      "reclassification",
      "geological features",
      "mantle",
      "crust",
      "structure",
      "water-related",
      '20 light-years',
      'candidate for supporting life',
      'red dwarf star',
      'allow liquid',
      '13 Earth days',
      'tidally locked',
      'astronomers',
      'conflicting'
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
