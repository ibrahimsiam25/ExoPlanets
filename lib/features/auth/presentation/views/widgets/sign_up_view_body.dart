import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../view models/login ano cubit/login_ano_cubit.dart';
import 'bottom_screen_actions.dart';
import 'custom_sign_up_form.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: CustomSignUpForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      confirmPasswordController: confirmPasswordController)),
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      vGap(40),
                      const BottomScreenActions(
                        backExists: true,
                        skipExists: true,
                      ),
                      vGap(20)
                    ],
                  ))
            ],
          )),
      BlocBuilder<LoginAnoCubit, LoginAnoState>(builder: (context, state) {
        if (state is LoginAnoLoading) {
          return Container(
              color: AppColors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ));
        }
        return const SizedBox.shrink();
      })
    ]);
  }
}
