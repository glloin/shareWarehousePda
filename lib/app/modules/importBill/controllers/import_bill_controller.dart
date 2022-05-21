import 'package:get/get.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';
import 'package:pda/app/data/models/view_import_notify_model.dart';
import 'package:pda/app/data/providers/import_notify_provider.dart';
import 'package:pda/app/data/providers/import_bill_provider.dart';
import 'package:pda/app/global/message.dart';
import 'package:pda/app/modules/importBill/views/notify_list_view.dart';

import '../views/scan_stock_code_view.dart';

class ImportBillController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Get.find<ImportBillProvider>()
        .getUnFinishiedList()
        .then((value) => datas.value = value)
        .catchError(onError);
  }

  final datas = Rx<List<ViewImportBill>>([]);

  void showNotifyDetail(ViewImportBill data) async {
    try {
      final datas = await Get.find<ImportNotifyProvider>().getViews(data.id!);
      Get.to(NotifyListView(data, datas));
    } catch (e) {
      onError(e);
    }
  }

  void scanStockCode(ViewImportBill data, ViewImportNotify notify) async {
    try {
      Get.to(ScanStockCodeView(data, notify));
    } catch (e) {
      onError(e);
    }
  }
}
