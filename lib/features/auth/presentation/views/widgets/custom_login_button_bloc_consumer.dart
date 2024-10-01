import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/show_toast.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/login%20cubit/login_cubit.dart';

class CustomLoginButtonBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const CustomLoginButtonBlocConsumer(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showToast(
              toastMsg: "Logged in Successfully", state: ToastStates.success);
          context.pushNamedAndRemoveUntil(AppRouter.bottomNavigationBar,
              predicate: (_) => false);
        } else if (state is LoginFailure) {
          showToast(toastMsg: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return CustomButton(
                icon:    SvgPicture.asset(
                    AppAssets.arrowForward,
                    width: 22.w,
                    height: 14.h,
                  ),
            onTap: () {},
            text: "Log In",
            child: Center(
              child: SizedBox(
                width: 29.w,
                height: 29.h,
                child: const CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ),
            ),
          );
        }
        return CustomButton(
              icon:    SvgPicture.asset(
                    AppAssets.arrowForward,
                    width: 22.w,
                    height: 14.h,
                  ),
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginCubit>().login(
                  email: emailController.text,
                  password: passwordController.text);
            }
          },
          text: "Log In",
        );
      },
    );
  }
}
