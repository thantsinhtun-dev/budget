import 'package:budget/src/core/app_images.dart';

enum TransitionType {
  cashIn("Cash In","+",AppImages.imgCashIn),
  cashOut("Cash Out","-",AppImages.imgCashOut);

  const TransitionType(this.title,this.sign,this.image);
  final String title;
  final String sign;
  final String image;
}