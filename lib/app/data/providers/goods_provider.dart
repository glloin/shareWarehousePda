import 'package:pda/app/data/models/select_item_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';

class GoodsProvider extends BaseConnectProvider {
  Future<List<SelectItem>> getSelectItems() async {
    final obj = await get('/api/Goods/getSelectItems');
    final res = getResponseData(obj);
    return (res as List).map((json) => SelectItem.fromJson(json)).toList();
  }
}
