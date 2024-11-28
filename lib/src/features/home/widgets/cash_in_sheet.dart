import 'package:budget/domain/model/transition_entity.dart';
import 'package:budget/domain/model/transition_type.dart';
import 'package:budget/src/core/app_colors.dart';
import 'package:budget/src/features/home/provider/transition_controller.dart';
import 'package:budget/src/routes/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_fonts.dart';
import '../../../core/dimens.dart';
import '../../../shared/widgets/custom_text_field.dart';

class CashInSheet extends ConsumerStatefulWidget {
  const CashInSheet({super.key});

  @override
  ConsumerState createState() => _CashInSheetState();
}

class _CashInSheetState extends ConsumerState<CashInSheet> {
  final TextEditingController _category = TextEditingController();
  final TextEditingController _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery
            .of(context)
            .viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kMarginMedium_2),
            Text(
              "Cash In",
              style: context.appFonts.header3(color: context.appColors.colorGreen),
            ),
            const SizedBox(height: kMarginMedium_2),
            CustomTextField(
              controller: _category,
              hintText: "Category",
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
              borderRadius: kMarginMedium_2,
              textInputType: TextInputType.text,
              cursorColor: context.appColors.colorGreen,
            ),
            const SizedBox(height: kMarginMedium_2),
            CustomTextField(
              controller: _amount,
              hintText: "Amount",
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium),
              borderRadius: kMarginMedium_2,
              textInputType: TextInputType.number,
              cursorColor: context.appColors.colorGreen,
            ),
            const SizedBox(height: kMarginMedium_2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              child: MaterialButton(
                onPressed: () {
                  var transition = TransitionEntity(title: _category.text,
                    amount: double.parse(_amount.text),
                    type: TransitionType.cashIn,);
                  var transitionRef = ref.read(transitionControllerProvider.notifier);
                  transitionRef.addTransition(transition,(){
                    context.pop();
                  });
                },
                color: context.appColors.colorGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kMarginMedium_2),
                ),
                minWidth: double.infinity,
                height: kMarginLargeX_3,
                child: Text("Save",
                    style: context.appFonts.body2(color: context.appColors.colorWhite)),
              ),
            ),
            const SizedBox(height: kMarginMedium_2),
          ],
        ),
      ),
    );
  }
}
