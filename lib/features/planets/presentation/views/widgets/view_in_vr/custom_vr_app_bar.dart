import 'package:flutter/material.dart';
import '../../../../../../core/helpers/app_assets.dart';
import '../../../../../../core/theme/app_text_styles.dart';



class CustomVRAppBar extends StatelessWidget {
  const CustomVRAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 40, left: 10),
          child: ListTile(
            leading: GestureDetector(
     onTap: () {
       Navigator.pop(context);
     },
     child: Image.asset(AppAssets.backIcon),
            ),
            title: Text(
     "VR",
     style: AppTextStyles.font27LightGreyW600,
            ),
          
          ),
        );
  }
}