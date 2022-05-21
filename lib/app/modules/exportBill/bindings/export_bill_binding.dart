import 'package:get/get.dart';
import 'package:pda/app/data/providers/export_bill_provider.dart';

import '../controllers/export_bill_controller.dart';

class ExportBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExportBillController>(() => ExportBillController(),
        fenix: true);
    Get.lazyPut<ExportBillProvider>(() => ExportBillProvider(), fenix: true);
  }
}
