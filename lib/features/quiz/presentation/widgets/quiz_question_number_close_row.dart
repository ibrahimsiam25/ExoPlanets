import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class QuizQuestionNumberCloseRow extends StatelessWidget {
  const QuizQuestionNumberCloseRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Q&A",
          style: AppTextStyles.font22WhiteW600,
        ),
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.close,
            size: 30.r,
          ),
        )
      ],
    );
  }
}
