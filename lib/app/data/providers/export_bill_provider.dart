import 'package:pda/app/data/providers/base_connect_provider.dart';
import '../models/view_export_bill_model.dart';

class ExportBillProvider extends BaseConnectProvider {
  Future<List<ViewExportBill>> getUnFinishiedList() async {
    final obj = await get('/api/ExportBill/getUnFinishedList');
    final res = getResponseData(obj);
    return (res as List).map((json) => ViewExportBill.fromJson(json)).toList();
  }
}
