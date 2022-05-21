import 'package:get/get.dart';
import 'package:pda/app/data/providers/export_order_provider.dart';

import '../controllers/export_order_controller.dart';

class ExportOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExportOrderController>(() => ExportOrderController(),
        fenix: true);
    Get.lazyPut<ExportOrderProvider>(() => ExportOrderProvider(), fenix: true);
  }
}
