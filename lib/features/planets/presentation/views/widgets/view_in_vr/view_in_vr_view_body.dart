import 'package:flutter/material.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/helpers/app_assets.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/view_in_vr/custom_vr_app_bar.dart';




class ViewInVrViewBody extends StatelessWidget {
  const ViewInVrViewBody({super.key, required this.planet3dModelPath});
 final String planet3dModelPath;
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 37),
                child: Column(
                  children: [
                 vGap(16),
                 Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image:DecorationImage(
      image: AssetImage(AppAssets.vrBackGround), // Use AssetImage here
      fit: BoxFit.cover, // Optional: you can change how the image fits
    ),
                      ),
                      child: Flutter3DViewer(
                                        progressBarColor: AppColors.grey,
                                        src: planet3dModelPath,
                                      ),
                    )
                  ],
                 )
                  ],
                ),
              ),
            ],
          ),
        const CustomVRAppBar()
        ],
      ),
    );
  }
}
