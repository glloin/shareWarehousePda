import 'package:pda/app/data/models/select_item_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';

class ImportBillProvider extends BaseConnectProvider {
  static const String controllerName = "/api/ImportBill/";
  Future<List<ViewImportBill>> getUnFinishiedList() async {
    final obj = await get('${controllerName}GetUnFinishiedList');
    final res = getResponseData(obj);
    return (res as List).map((json) => ViewImportBill.fromJson(json)).toList();
  }

  Future<List<SelectItem>> getSelectItems() async {
    final obj = await get('${controllerName}getSelectItems');
    final res = getResponseData(obj);
    return (res as List).map((json) => SelectItem.fromJson(json)).toList();
  }
}
