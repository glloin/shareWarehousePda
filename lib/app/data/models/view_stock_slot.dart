import 'package:decimal/decimal.dart';

class ViewStockSlot {
  String? flag;
  int? id;
  dynamic lastTime;
  Decimal? quantity;
  String? remark;
  int? slotId;
  String? slotCode;
  String? stockCode;
  int? time;
  String? lanewayName;
  String? warehouseName;
  String? orderNo;
  String? billCode;
  String? goodsName;
  int? productionDate;
  String? goodsStatus;

  ViewStockSlot(
      {this.flag,
      this.id,
      this.lastTime,
      this.quantity,
      this.remark,
      this.slotId,
      this.slotCode,
      this.stockCode,
      this.time,
      this.lanewayName,
      this.warehouseName,
      this.orderNo,
      this.billCode,
      this.goodsName,
      this.productionDate,
      this.goodsStatus});

  ViewStockSlot.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    id = json['id'];
    lastTime = json['lastTime'];
    quantity = Decimal.parse(json['quantity'].toString());
    remark = json['remark'];
    slotId = json['slotId'];
    slotCode = json['slotCode'];
    stockCode = json['stockCode'];
    time = json['time'];
    lanewayName = json['lanewayName'];
    warehouseName = json['warehouseName'];
    orderNo = json['orderNo'];
    billCode = json['billCode'];
    goodsName = json['goodsName'];
    productionDate = json['productionDate'];
    goodsStatus = json['goodsStatus'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['flag'] = flag;
    data['id'] = id;
    data['lastTime'] = lastTime;
    data['quantity'] = quantity;
    data['remark'] = remark;
    data['slotId'] = slotId;
    data['slotCode'] = slotCode;
    data['stockCode'] = stockCode;
    data['time'] = time;
    data['lanewayName'] = lanewayName;
    data['warehouseName'] = warehouseName;
    data['orderNo'] = orderNo;
    data['billCode'] = billCode;
    data['goodsName'] = goodsName;
    data['productionDate'] = productionDate;
    data['goodsStatus'] = goodsStatus;
    return data;
  }
}
