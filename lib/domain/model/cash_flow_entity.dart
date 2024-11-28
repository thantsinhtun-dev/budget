import 'package:budget/src/extensions/ext_double.dart';

class CashFlowEntity {
  String id;
  double totalAmount;
  double cashIn;
  double cashOut;

  CashFlowEntity({
    required this.id,
    required this.totalAmount,
    required this.cashIn,
    required this.cashOut,
  });

  factory CashFlowEntity.fromJson(Map<String, dynamic> json) => CashFlowEntity(
    id: json["id"],
    totalAmount: json["totalAmount"],
    cashIn: json["cashIn"],
    cashOut: json["cashOut"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "totalAmount": totalAmount,
    "cashIn": cashIn,
    "cashOut": cashOut,
  };

  @override
  String toString() {
    return toJson().toString();
  }

  String getTotalAmount() => "${totalAmount.formatNumber()} MMK";
  String getCashInAmount() => cashIn.formatNumber();
  String getCashOutAmount() => cashOut.formatNumber();

}
