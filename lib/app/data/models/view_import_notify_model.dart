import 'package:decimal/decimal.dart';

class ViewImportNotify {
  int? id;
  String? goodsName;
  Decimal? quantity;
  Decimal? factQuantity;
  Decimal? completeQuantity;
  int? productionDate;
  String? goodsStatusName;

  ViewImportNotify(
      {this.id,
      this.goodsName,
      this.quantity,
      this.factQuantity,
      this.completeQuantity,
      this.productionDate,
      this.goodsStatusName});

  ViewImportNotify.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsName = json['goodsName'];
    quantity = Decimal.parse(json['quantity'].toString());
    factQuantity = Decimal.parse(json['factQuantity'].toString());
    completeQuantity = Decimal.parse(json['completeQuantity'].toString());
    productionDate = json['productionDate'];
    goodsStatusName = json['goodsStatusName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['goodsName'] = goodsName;
    data['quantity'] = quantity;
    data['factQuantity'] = factQuantity;
    data['completeQuantity'] = completeQuantity;
    data['productionDate'] = productionDate;
    data['goodsStatusName'] = goodsStatusName;
    return data;
  }
}
