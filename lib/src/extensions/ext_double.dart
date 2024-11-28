import 'package:intl/intl.dart';

extension DateExt on double {

  String formatNumber(){
    final currencyFormatter = NumberFormat('#,##0.0');
    return currencyFormatter.format(this);
  }
}