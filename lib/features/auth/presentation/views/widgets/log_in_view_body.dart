import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/login%20ano%20cubit/login_ano_cubit.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/custom_login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import 'bottom_screen_actions.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({super.key});

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: CustomLoginForm(
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController)),
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
                  ),
                )
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
      ],
    );
  }
}
