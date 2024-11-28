import 'package:budget/src/core/app_colors.dart';
import 'package:budget/src/core/app_images.dart';
import 'package:budget/src/core/dimens.dart';
import 'package:budget/src/extensions/ext_dialog.dart';
import 'package:budget/src/routes/app_route_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/social_login_button.dart';
import '../provider/auth_controller.dart';
import '../provider/auth_state.dart';

class OnboardScreen extends ConsumerStatefulWidget {
  const OnboardScreen({super.key});

  @override
  ConsumerState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends ConsumerState<OnboardScreen> {
  @override
  void initState() {
    super.initState();
    var authController = ref.read(authControllerProvider.notifier);
    authController.checkLoginState(() {
      HomeRoute().pushReplacement(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var authController = ref.watch(authControllerProvider);
    return Scaffold(
        backgroundColor: context.appColors.colorSecondary,
        body: switch (authController) {
          AuthInitialState() => const SplashWidget(),
          AuthLoginState() => const LoginWidget(),
        });
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset(AppImages.appLogo)],
    );
  }
}

class LoginWidget extends ConsumerWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.appLogo),
        const SizedBox(height: kMarginExtraLarge_3 + kMarginExtraLarge_3),
        SocialLoginButton(
          title: "Login With Google",
          titleColor: context.appColors.colorPrimaryText,
          bgColor: context.appColors.colorWhite,
          logo: AppImages.logoGoogle,
          onPressed: () {
            var authController = ref.read(authControllerProvider.notifier);
            authController.googleLogin(
              onSuccess: () {
                HomeRoute().pushReplacement(context);
              },
              onFailure: (title, msg) {
                context.showSnackBar(title: title,msg: msg);
              },
            );
          },
        )
      ],
    );
  }
}
