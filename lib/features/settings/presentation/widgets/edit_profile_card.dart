import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/settings/presentation/widgets/settings_profile_avatar.dart';

class EditProfileCard extends StatelessWidget {
  const EditProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 18.0.w),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(32.0.r),
      ),
      child: Column(
        children: [
          vGap(22.0),
          Text(
            'Edit Profile',
            style: AppTextStyles.font15WhiteW500,
          ),
          vGap(8.0),
          SettingsProfileAvatar(
            imageUrl: getIt.get<FirebaseAuth>().currentUser?.photoURL,
          ),
          vGap(8.0),
          Text(
            getIt.get<FirebaseAuth>().currentUser == null
                ? "unknown user"
                : getIt.get<FirebaseAuth>().currentUser!.displayName ?? 'user',
            style: AppTextStyles.font15WhiteW500,
          ),
          vGap(4.0),
          SizedBox(
            width: 36.0.w,
            child: const Divider(
              color: AppColors.lightGrey9A,
              thickness: 2.0,
              height: 0.0,
            ),
          ),
          vGap(4.0),
          Text(
            getIt.get<FirebaseAuth>().currentUser == null
                ? ""
                : getIt.get<FirebaseAuth>().currentUser!.email ?? '',
            style: AppTextStyles.font10WhiteNormal,
          ),
          vGap(40.0),
        ],
      ),
    );
  }
}
