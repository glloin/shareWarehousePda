import 'package:decimal/decimal.dart';
import 'package:pda/app/extensions.dart';

class ViewExportOrder {
  String? goodsName;
  String? billCode;
  String? slotCode;
  int? id;
  int? notifyId;
  String? orderNo;
  Decimal? quantity;
  int? time;
  String? stockCode;
  String? supplierName;
  String? customerName;
  String? executeFlag;
  String? importOrderNo;
  String? importBillCode;
  String? userName;

  ViewExportOrder(
      {this.goodsName,
      this.billCode,
      this.slotCode,
      this.id,
      this.notifyId,
      this.orderNo,
      this.quantity,
      this.time,
      this.stockCode,
      this.supplierName,
      this.customerName,
      this.executeFlag,
      this.importOrderNo,
      this.importBillCode,
      this.userName});

  ViewExportOrder.fromJson(Map<String, dynamic> json) {
    goodsName = json['goodsName'];
    billCode = json['billCode'];
    slotCode = json['slotCode'];
    id = json['id'];
    notifyId = json['notifyId'];
    orderNo = json['orderNo'];
    quantity = json['quantity'].toString().toDecimal();
    time = json['time'];
    stockCode = json['stockCode'];
    supplierName = json['supplierName'];
    customerName = json['customerName'];
    executeFlag = json['executeFlag'];
    importOrderNo = json['importOrderNo'];
    importBillCode = json['importBillCode'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['goodsName'] = goodsName;
    data['billCode'] = billCode;
    data['slotCode'] = slotCode;
    data['id'] = id;
    data['notifyId'] = notifyId;
    data['orderNo'] = orderNo;
    data['quantity'] = quantity;
    data['time'] = time;
    data['stockCode'] = stockCode;
    data['supplierName'] = supplierName;
    data['customerName'] = customerName;
    data['executeFlag'] = executeFlag;
    data['importOrderNo'] = importOrderNo;
    data['importBillCode'] = importBillCode;
    data['userName'] = userName;
    return data;
  }
}
