import 'package:budget/src/core/app_colors.dart';
import 'package:budget/src/core/app_fonts.dart';
import 'package:budget/src/features/home/provider/transition_controller.dart';
import 'package:budget/src/features/home/provider/transition_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/dimens.dart';
import 'transition_history.dart';

class HistoryWidget extends ConsumerWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var transitions = ref.watch(transitionControllerProvider);
    return  switch(transitions){
      TransitionInitialState() => const SizedBox(),
      TransitionSuccessState() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "History",
            style: context.appFonts.header3(),
            textAlign: TextAlign.start,
          ),
          Expanded(
            child: Card(
              child: ListView.separated(
                itemCount: transitions.list.length,
                itemBuilder: (context, index) {
                  return HistoryListTile(entity: transitions.list[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
                    child: Divider(height: 2,color: context.appColors.colorGrey,thickness: 0.1,),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    };
  }
}
