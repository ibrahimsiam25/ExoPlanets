import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/model/user_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'custom_leaders_widget.dart';

class CustomTopThreeContainer extends StatelessWidget {
  final List<UserModel> top3Users;
  const CustomTopThreeContainer({super.key, required this.top3Users});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 22.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          31.r,
        ),
        color: AppColors.selectedAnswerGrey.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Top Space Voyager",
            style: AppTextStyles.font20WhiteW600,
          ),
          vGap(30),
          SizedBox(
            height: context.height * 0.2,
            child: ListView.separated(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Transform.scale(
                    scale: index == 1 ? 1 : 0.8,
                    child: CustomLeadersWidget(
                      index: index,
                      top3Users: top3Users,
                    )),
                separatorBuilder: (context, index) => hGap(12),
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
