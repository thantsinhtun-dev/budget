import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_fonts.dart';
import '../../core/dimens.dart';

class CashButton extends StatelessWidget {
  const CashButton({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleColor,
    this.subTitleColor,
    required this.bgColor,
    required this.img,
    required this.onPressed,
  });

  final String title;
  final String subTitle;
  final Color? titleColor;
  final Color? subTitleColor;
  final Color? bgColor;
  final String img;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () => onPressed(),
        color: bgColor,
        height: 56,
        padding: const EdgeInsets.symmetric(
          vertical: kMarginMedium,
          horizontal: kMarginMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kMarginMedium),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(img, height: kMarginLargeX),
            const SizedBox(width: kMarginCardMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.appFonts.body2(
                      color: titleColor,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: context.appFonts.body4(
                      color: subTitleColor,
                    ),
                  ),
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}
