import 'package:flutter/material.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/helpers/app_assets.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';



class CustomPlanetViewInVR extends StatefulWidget {
  const CustomPlanetViewInVR({super.key, required this.planet3dModelPath});
  final String planet3dModelPath;
  @override
  State<CustomPlanetViewInVR> createState() => _CustomPlanetViewInVRState();
}

class _CustomPlanetViewInVRState extends State<CustomPlanetViewInVR> {
  double height = 0.3;
  final double maxHeight = 0.5;
  final double minHeight = 0.1;
  final double increment = 0.05;

  void increaseHeight() {
    setState(() {
      if (height + increment <= maxHeight) {
        height += increment;
      } else {
        height = maxHeight;
      }
    });
  }

  void decreaseHeight() {
    setState(() {
      if (height - increment >= minHeight) {
        height -= increment;
      } else {
        height = minHeight;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.37,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            border: Border.all(color: AppColors.white, width: 2),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * height,
                child: Flutter3DViewer(
                  progressBarColor: AppColors.grey,
                  src: widget.planet3dModelPath,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 13,
          top: 13,
          child: Row(
            children: [
              GestureDetector(
                onTap: increaseHeight,
                child: Image.asset(AppAssets.bigIcon),
              ),
              hGap(5),
              GestureDetector(
                onTap: decreaseHeight,
                child: Image.asset(AppAssets.smallIcon),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
