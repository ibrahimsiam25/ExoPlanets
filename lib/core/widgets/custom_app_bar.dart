import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/core%20cubits/cubit/get_user_data_cubit.dart';
import 'package:exo_planets/core/helpers/network_image_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theme/app_colors.dart';
import '../helpers/app_assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserDataCubit>()..getUserData(),
      child: Builder(builder: (context) {
        return Container(
            width: double.infinity,
            height: 46.h,
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.all(Radius.circular(23.r)),
            ),
            child: Row(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Image.asset(
                  AppAssets.appBarLogo,
                ),
                hGap(20),
                const Spacer(
                  flex: 1,
                ),
                StreamBuilder<String>(
                    stream: getIt
                        .get<FirebaseFirestore>()
                        .collection("users")
                        .doc(getIt.get<FirebaseAuth>().currentUser!.uid)
                        .snapshots()
                        .map((snapshot) =>
                            snapshot.data()?["imageUrl"] ?? "Unknown"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: SizedBox(
                                width: 25.w,
                                height: 25.h,
                                child: const CircularProgressIndicator()),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        log(snapshot.error.toString());
                        return Image(
                          image: networkImageHelper(""),
                        );
                      } else if (snapshot.hasData) {
                        return CircleAvatar(
                          radius: 23.r,
                          backgroundImage:
                              networkImageHelper(snapshot.data ?? "Unknown"),
                        );
                      }
                      return Image(
                        image: networkImageHelper(""),
                      );
                    })
              ],
            ));
      }),
    );
  }
}
