import 'package:pda/app/data/providers/base_connect_provider.dart';
import '../models/view_export_order_model.dart';

class ExportOrderProvider extends BaseConnectProvider {
  Future<List<ViewExportOrder>> getUnFinishiedList() async {
    final obj = await get('/api/ExportOrder/getUnFinishedViews');
    final res = getResponseData(obj);
    return (res as List).map((json) => ViewExportOrder.fromJson(json)).toList();
  }
}
