import 'package:flutter/material.dart';
import 'package:exo_planets/features/planets/presentation/views/widgets/view_in_vr/custom_vr_app_bar.dart';


class ViewInVrViewBody extends StatelessWidget {
  const ViewInVrViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                 
                  ],
                ),
              ),
            ],
          ),
         CustomVRAppBar()
        ],
      ),
    );
  }
}
