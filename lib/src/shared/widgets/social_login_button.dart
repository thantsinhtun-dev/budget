
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_fonts.dart';
import '../../core/dimens.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.titleColor,
    required this.bgColor,
    required this.logo,
    required this.onPressed,
  });

  final String title;
  final Color titleColor;
  final Color bgColor;
  final String logo;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      child: MaterialButton(
        onPressed: () => onPressed(),
        color: bgColor,
        height: 56,
        padding: const EdgeInsets.symmetric(
          vertical: kMarginMedium,
          horizontal: kMarginLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kMarginCardMedium),
        ),
        child: Row(
          children: [
            Image.asset(logo, height: kMarginLarge),
            const SizedBox(width: kMarginMedium_2),
            Text(
              title,
              style: context.appFonts.customFont(
                fontWeight: FontWeight.w600,
                fontSize: FontSize.s15,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}