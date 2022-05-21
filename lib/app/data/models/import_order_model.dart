import 'package:decimal/decimal.dart';

class ImportOrder {
  int? notifyId;
  String? stockCode;
  Decimal? quantity;
  String? goodsName;

  ImportOrder({this.notifyId, this.stockCode, this.quantity, this.goodsName});

  ImportOrder.fromJson(Map<String, dynamic> json) {
    notifyId = json['notifyId'];
    stockCode = json['stockCode'];
    quantity = Decimal.parse(json['quantity'].toString());
    goodsName = json['goodsName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notifyId'] = notifyId;
    data['stockCode'] = stockCode;
    data['quantity'] = quantity;
    data['goodsName'] = goodsName;
    return data;
  }
}
