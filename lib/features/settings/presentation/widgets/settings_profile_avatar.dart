import 'dart:io';

import 'package:exo_planets/core/core%20cubits/cubit/get_user_data_cubit.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/network_image_helper.dart';
import 'package:exo_planets/core/helpers/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/app_colors.dart';

class SettingsProfileAvatar extends StatefulWidget {
  final String? imageUrl;
  const SettingsProfileAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  State<SettingsProfileAvatar> createState() => _SettingsProfileAvatarState();
}

class _SettingsProfileAvatarState extends State<SettingsProfileAvatar> {
  String? filePath;
  Future<void> pickImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        filePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104.0.w,
      height: 104.0.w,
      child: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.profileAvatar,
            fit: BoxFit.fill,
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocBuilder<UserDataCubit, UserDataState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      CircleAvatar(
                        radius: 100.r,
                        backgroundImage: filePath != null
                            ? FileImage(File(filePath!))
                            : networkImageHelper(widget.imageUrl ?? ""),
                      ),
                      if (state is UserDataLoading)
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        )
                    ],
                  );
                },
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () async {
                await pickImage();
                if (filePath != null) {
                  if (context.mounted) {
                    await context
                        .read<UserDataCubit>()
                        .updateUserImage(filePath!);
                  }

                  showToast(
                      toastMsg: "Avatar Updated Successfully",
                      state: ToastStates.success);
                }
              },
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 18.0.r,
                child: Center(
                  child: Image.asset(
                    AppAssets.pencil,
                    width: 20.0.w,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
