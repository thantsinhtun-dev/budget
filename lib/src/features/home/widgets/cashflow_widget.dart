import 'package:budget/src/core/app_colors.dart';
import 'package:budget/src/core/app_fonts.dart';
import 'package:budget/src/extensions/ext_date.dart';
import 'package:budget/src/features/home/provider/home_controller.dart';
import 'package:budget/src/features/home/provider/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_images.dart';
import '../../../core/dimens.dart';
import '../../../shared/widgets/cash_button.dart';
import 'cash_in_sheet.dart';
import 'cash_out_sheet.dart';

class CashFlowWidget extends ConsumerWidget {
  const CashFlowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cashFlow = ref.watch(homeControllerProvider);
    return switch (cashFlow) {
      HomeInitialState() => const CircularProgressIndicator(),
      HomeSuccessState() => Column(
          children: [
            Card.filled(
              color: context.appColors.colorSecondary,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: kMarginMedium_2,
                  vertical: kMarginMedium_2,
                ),
                width: double.infinity,
                height: kMarginExtraLarge_1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Balance",
                            style: context.appFonts
                                .body3(color: context.appColors.colorWhite)),
                        Text(cashFlow.entity.getTotalAmount(),
                            style: context.appFonts
                                .header3(color: context.appColors.colorWhite)),
                        const Spacer(),
                        Text(
                          context.getCurrentDate(),
                          style: context.appFonts.body3(
                            color: context.appColors.colorWhite,
                          ),
                        )
                      ],
                    ),
                    Image.asset(AppImages.imgWallet, scale: kMarginMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: kMarginMedium_2),
            Row(
              children: [
                CashButton(
                  title: cashFlow.entity.getCashInAmount(),
                  subTitle: 'MMK',
                  titleColor: context.appColors.colorGreen,
                  subTitleColor: context.appColors.colorGrey,
                  bgColor: context.appColors.colorWhite,
                  img: AppImages.imgCashIn,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const CashInSheet();
                      },
                    );
                  },
                ),
                const SizedBox(width: kMarginMedium_2),
                CashButton(
                  title: cashFlow.entity.getCashOutAmount(),
                  subTitle: 'MMK',
                  titleColor: context.appColors.colorRed,
                  subTitleColor: context.appColors.colorGrey,
                  bgColor: context.appColors.colorWhite,
                  img: AppImages.imgCashOut,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const CashOutSheet();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
    };
  }
}
