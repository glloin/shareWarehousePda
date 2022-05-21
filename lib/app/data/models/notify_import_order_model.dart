import 'package:decimal/decimal.dart';
import 'package:pda/app/extensions.dart';

class NotifyImportOrder {
  late int notifyId;
  late String billCode;
  late Decimal quantity;
  late Decimal factQuantity;
  late String goodsName;
  late int billId;

  NotifyImportOrder(
      {required this.notifyId,
      required this.billCode,
      required this.quantity,
      required this.factQuantity,
      required this.goodsName,
      required this.billId});

  NotifyImportOrder.fromJson(Map<String, dynamic> json) {
    notifyId = json['notifyId'];
    billCode = json['billCode'];
    quantity = json['quantity'].toString().toDecimal();
    factQuantity = json['factQuantity'].toString().toDecimal();
    goodsName = json['goodsName'];
    billId = json['billId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notifyId'] = notifyId;
    data['billCode'] = billCode;
    data['quantity'] = quantity;
    data['factQuantity'] = factQuantity;
    data['goodsName'] = goodsName;
    data['billId'] = billId;
    return data;
  }
}
