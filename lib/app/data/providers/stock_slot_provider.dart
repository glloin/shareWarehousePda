import 'package:pda/app/data/models/view_stock_slot.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import '../models/pagenation_data_model.dart';

class StockSlotProvider extends BaseConnectProvider {
  Future<PagenationData<ViewStockSlot>> getViews(GetViewQueryData data) async {
    final obj = await get('/api/StockSlot/getViews', query: data.toJson());
    final res = getResponseData(obj);
    return PagenationData.fromJson(res, (s) => ViewStockSlot.fromJson(s));
  }
}

class GetViewQueryData {
  GetViewQueryData(
      {required this.current,
      required this.pageSize,
      this.billCode,
      this.slotCode,
      this.goodsId,
      this.start,
      this.end});
  late int current;
  late int pageSize;
  int? start;
  int? end;
  String? billCode;
  String? slotCode;
  int? goodsId;
  GetViewQueryData.fromJson(Map<String, dynamic> json) {
    current = json['Current'];
    pageSize = json['PageSize'];
    billCode = json['BillCode'];
    slotCode = json['SlotCode'];
    goodsId = json['GoodsId'];
    start = json['Start'];
    end = json['End'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Current'] = current.toString();
    data['PageSize'] = pageSize.toString();
    if (billCode != null) {
      data['BillCode'] = billCode.toString();
    }
    if (slotCode != null) {
      data['SlotCode'] = slotCode.toString();
    }
    if (goodsId != null) {
      data['GoodsId'] = goodsId.toString();
    }
    if (start != null) {
      data['start'] = start.toString();
    }
    if (end != null) {
      data['end'] = end.toString();
    }
    return data;
  }
}
