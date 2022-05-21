import 'package:pda/app/data/models/notify_select_item_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import '../models/view_import_notify_model.dart';

class ImportNotifyProvider extends BaseConnectProvider {
  Future<List<ViewImportNotify>> getViews(int billId) async {
    final obj = await get('/api/ImportNotify/getViews?billId=$billId');
    final res = getResponseData(obj);
    return (res as List)
        .map((json) => ViewImportNotify.fromJson(json))
        .toList();
  }

  Future<List<NotifySelectItem>> getSelectItems(int billId) async {
    final obj = await get('/api/ImportNotify/getSelectItems?billId=$billId');
    final res = getResponseData(obj);
    return (res as List)
        .map((json) => NotifySelectItem.fromJson(json))
        .toList();
  }

  Future<bool> setNotify(int notifyId) async {
    final obj = await get('/api/ImportNotify/setNotify?notifyId=$notifyId');
    return obj.status.code == 200;
  }
}
