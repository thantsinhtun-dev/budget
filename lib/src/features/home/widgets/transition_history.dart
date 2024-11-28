import 'package:budget/domain/model/transition_entity.dart';
import 'package:budget/domain/model/transition_type.dart';
import 'package:budget/src/core/app_colors.dart';
import 'package:budget/src/core/app_fonts.dart';
import 'package:budget/src/extensions/ext_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({super.key, required this.entity});

  final TransitionEntity entity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        entity.type.image,
        scale: 1.5,
      ),
      title: Text(entity.title),
      subtitle: Text(
        entity.date.getTransitionDate(),
        style: context.appFonts.body4(color: context.appColors.colorGrey),
      ),
      trailing: Text(
        entity.getAmount(),
        style: context.appFonts.body2(
          color: entity.type == TransitionType.cashIn
              ? context.appColors.colorGreen
              : context.appColors.colorRed,
        ),
      ),
    );
  }
}
