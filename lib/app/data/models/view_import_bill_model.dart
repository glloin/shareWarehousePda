import 'package:decimal/decimal.dart';

class ViewImportBill {
  String? code;
  dynamic customerId;
  dynamic customerName;
  int? id;
  dynamic supplierId;
  dynamic supplierName;
  int? time;
  Decimal? quantity;
  Decimal? factQuantity;
  Decimal? completeQuantity;
  String? executeFlag;
  String? userName;

  ViewImportBill(
      {this.code,
      this.customerId,
      this.customerName,
      this.id,
      this.supplierId,
      this.supplierName,
      this.time,
      this.quantity,
      this.factQuantity,
      this.completeQuantity,
      this.executeFlag,
      this.userName});

  ViewImportBill.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    id = json['id'];
    supplierId = json['supplierId'];
    supplierName = json['supplierName'];
    time = json['time'];
    quantity = Decimal.parse(json['quantity'].toString());
    factQuantity = Decimal.parse(json['factQuantity'].toString());
    completeQuantity = Decimal.parse(json['completeQuantity'].toString());
    executeFlag = json['executeFlag'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['id'] = id;
    data['supplierId'] = supplierId;
    data['supplierName'] = supplierName;
    data['time'] = time;
    data['quantity'] = quantity;
    data['factQuantity'] = factQuantity;
    data['completeQuantity'] = completeQuantity;
    data['executeFlag'] = executeFlag;
    data['userName'] = userName;
    return data;
  }
}
