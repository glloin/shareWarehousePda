import 'package:pda/app/data/providers/base_connect_provider.dart';

class EquipmentTaskProvider extends BaseConnectProvider {
  Future<bool> emptyStockImport(String stockCode, int quantity) async {
    final res = await get(
        '/Api/EquipmentTask/emptyStockImport?stockCode=$stockCode&quantity=$quantity');
    return res.status.code == 200;
  }
}
