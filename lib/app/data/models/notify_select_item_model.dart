import 'package:decimal/decimal.dart';

class NotifySelectItem {
  Decimal? quantity;
  Decimal? factQuantity;
  int? value;
  String? label;

  NotifySelectItem({this.quantity, this.factQuantity, this.value, this.label});

  NotifySelectItem.fromJson(Map<String, dynamic> json) {
    quantity = Decimal.parse(json['quantity'].toString());
    factQuantity = Decimal.parse(json['factQuantity'].toString());
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['factQuantity'] = factQuantity;
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}
