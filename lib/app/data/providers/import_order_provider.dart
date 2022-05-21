import 'package:pda/app/data/models/view_import_order_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';

class ImportOrderProvider extends BaseConnectProvider {
  Future<List<ViewImportOrder>> getUnFinishiedList() async {
    final obj = await get('/api/ImportOrder/getUnFinishedViews');
    final res = getResponseData(obj);
    return (res as List).map((json) => ViewImportOrder.fromJson(json)).toList();
  }

  Future<ViewImportOrder> cancel(int id) async {
    final obj = await get('/api/ImportOrder/cancel?id=$id');
    final res = getResponseData(obj);
    return ViewImportOrder.fromJson(res);
  }

  Future<int> add(int notifyId, String stockCode) async {
    final obj = await get(
        '/api/ImportOrder/add?notifyId=$notifyId&stockCode=$stockCode');
    final res = getResponseData(obj);
    return res;
  }

  Future<int> faultImport(String stockCode) async {
    final obj = await get('/api/ImportOrder/faultImport?stockCode=$stockCode');
    final res = getResponseData(obj);
    return res;
  }
}
