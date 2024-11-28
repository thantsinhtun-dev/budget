import 'package:budget/src/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension DialogExt on BuildContext {
  showLoading() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => Center(
        child: PopScope(
          canPop: false,
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: appColors.colorSecondary,
            ),
          ),
        ),
      ),
    );
  }

  hideLoading() {
    Navigator.of(this).pop();
  }

  void showSnackBar({
    required String title,
    required String msg,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: appColors.colorRed,
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6.0,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(msg),
          ],
        ),
      ),
    );
  }
}
