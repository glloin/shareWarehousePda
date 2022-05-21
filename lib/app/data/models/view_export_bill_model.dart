import 'package:decimal/decimal.dart';
import 'package:pda/app/extensions.dart';

class ViewExportBill {
  String? code;
  int? customerId;
  String? customerName;
  int? id;
  int? supplierId;
  String? supplierName;
  int? time;
  Decimal? quantity;
  Decimal? factQuantity;
  Decimal? completeQuantity;
  String? executeFlag;
  String? userName;

  ViewExportBill(
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

  ViewExportBill.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    id = json['id'];
    supplierId = json['supplierId'];
    supplierName = json['supplierName'];
    time = json['time'];
    quantity = json['quantity'].toString().toDecimal();
    factQuantity = json['factQuantity'].toString().toDecimal();
    completeQuantity = json['completeQuantity'].toString().toDecimal();
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
