import 'package:flutter/material.dart';

class PlanetsPageView extends StatelessWidget {
  final List<String> imagePaths;
  final double width;
  final double height;
  final int angle;
  final PageController pageController;
  final VoidCallback planetTwoClick;

  const PlanetsPageView({
    super.key,
    required this.imagePaths,
    required this.width,
    required this.height,
    required this.angle,
    required this.planetTwoClick,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * 3.141592653589793 / 180, // Convert angle to radians
      child: PageView.builder(
        controller: pageController,
        reverse: true,
        scrollDirection: Axis.vertical,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index + 2 < imagePaths.length) // Check if index + 2 is valid
                Image.asset(
                  imagePaths[index + 2],
                  width: width - 56,
                  height: height - 56,
                ),
              if (index + 1 < imagePaths.length) // Check if index + 1 is valid
                GestureDetector(
                  onTap: planetTwoClick,
                  child: Image.asset(
                    imagePaths[index + 1],
                    width: width - 33,
                    height: height - 33,
                  ),
                ),
              if (index < imagePaths.length) // Check if current index is valid
                Image.asset(
                  imagePaths[index],
                  width: width,
                  height: height,
                ),
            ],
          );
        },
      ),
    );
  }
}
