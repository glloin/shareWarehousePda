import 'package:get/get.dart';
import 'package:pda/app/data/providers/import_bill_provider.dart';
import 'package:pda/app/data/providers/import_notify_provider.dart';
import 'package:pda/app/data/providers/import_order_provider.dart';
import 'package:pda/app/modules/importBill/controllers/scan_stock_code_controller.dart';
import '../controllers/import_bill_controller.dart';

class ImportBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImportBillController());
    Get.lazyPut(() => ScanStockCodeController(), fenix: true);
    Get.lazyPut(() => ImportBillProvider());
    Get.lazyPut(() => ImportNotifyProvider());
    Get.lazyPut(() => ImportOrderProvider(), fenix: true);
  }
}
