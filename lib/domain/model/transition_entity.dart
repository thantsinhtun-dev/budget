import 'package:budget/src/extensions/ext_double.dart';

import 'transition_type.dart';

class TransitionEntity {
  String id;
  String title;
  double amount;
  String date;
  TransitionType type;

  TransitionEntity({
    this.id = "",
    required this.title,
    required this.amount,
    this.date = "",
    required this.type,
  });

  factory TransitionEntity.fromJson(Map<String, dynamic> json) => TransitionEntity(
    id: json["id"],
    title: json["title"],
    amount: json["amount"],
    date: json["date"],
    type: TransitionType.values.byName(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "amount": amount,
    "date": date,
    "type": type.name,
  };

  @override
  String toString() {
    return toJson().toString();
  }

  String getAmount(){
    return "${type.sign} ${getTotalAmount()} MMK";
  }

  String getTotalAmount() => amount.formatNumber();

}
