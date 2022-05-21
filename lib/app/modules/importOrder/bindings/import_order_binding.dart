import 'package:get/get.dart';
import 'package:pda/app/data/providers/import_bill_provider.dart';
import 'package:pda/app/data/providers/import_notify_provider.dart';
import 'package:pda/app/data/providers/import_order_provider.dart';
import '../controllers/import_order_controller.dart';

class ImportOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportOrderController>(() => ImportOrderController(),
        fenix: true);
    Get.lazyPut<ImportOrderProvider>(() => ImportOrderProvider(), fenix: true);
    Get.lazyPut<ImportNotifyProvider>(() => ImportNotifyProvider(),
        fenix: true);
    Get.lazyPut<ImportBillProvider>(() => ImportBillProvider(), fenix: true);
  }
}
