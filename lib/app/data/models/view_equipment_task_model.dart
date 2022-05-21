import 'package:decimal/decimal.dart';
import 'package:pda/app/extensions.dart';

class ViewEquipmentTask {
  String? begin;
  String? end;
  String? from;
  String? goodsInfo;
  String? executeFlag;
  String? groupTaskNo;
  int? height;
  int? id;
  dynamic lanewayName;
  int? priority;
  Decimal? quantity;
  String? remark;
  Decimal? returnQuantity;
  String? slotCode;
  Decimal? slotQuantity;
  String? stackerName;
  String? stockCode;
  String? taskMode;
  String? taskNo;
  int? time;
  String? warehouseName;
  int? row;
  int? column;
  int? layer;

  ViewEquipmentTask(
      {this.begin,
      this.end,
      this.from,
      this.goodsInfo,
      this.executeFlag,
      this.groupTaskNo,
      this.height,
      this.id,
      this.lanewayName,
      this.priority,
      this.quantity,
      this.remark,
      this.returnQuantity,
      this.slotCode,
      this.slotQuantity,
      this.stackerName,
      this.stockCode,
      this.taskMode,
      this.taskNo,
      this.time,
      this.warehouseName,
      this.row,
      this.column,
      this.layer});

  ViewEquipmentTask.fromJson(Map<String, dynamic> json) {
    begin = json['begin'];
    end = json['end'];
    from = json['from'];
    goodsInfo = json['goodsInfo'];
    executeFlag = json['executeFlag'];
    groupTaskNo = json['groupTaskNo'];
    height = json['height'];
    id = json['id'];
    lanewayName = json['lanewayName'];
    priority = json['priority'];
    quantity = json['quantity'].toString().toDecimal();
    remark = json['remark'];
    returnQuantity = json['returnQuantity'].toString().toDecimal();
    slotCode = json['slotCode'];
    slotQuantity = json['slotQuantity'].toString().toDecimal();
    stackerName = json['stackerName'];
    stockCode = json['stockCode'];
    taskMode = json['taskMode'];
    taskNo = json['taskNo'];
    time = json['time'];
    warehouseName = json['warehouseName'];
    row = json['row'];
    column = json['column'];
    layer = json['layer'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['begin'] = begin;
    data['end'] = end;
    data['from'] = from;
    data['goodsInfo'] = goodsInfo;
    data['executeFlag'] = executeFlag;
    data['groupTaskNo'] = groupTaskNo;
    data['height'] = height;
    data['id'] = id;
    data['lanewayName'] = lanewayName;
    data['priority'] = priority;
    data['quantity'] = quantity;
    data['remark'] = remark;
    data['returnQuantity'] = returnQuantity;
    data['slotCode'] = slotCode;
    data['slotQuantity'] = slotQuantity;
    data['stackerName'] = stackerName;
    data['stockCode'] = stockCode;
    data['taskMode'] = taskMode;
    data['taskNo'] = taskNo;
    data['time'] = time;
    data['warehouseName'] = warehouseName;
    data['row'] = row;
    data['column'] = column;
    data['layer'] = layer;
    return data;
  }
}
