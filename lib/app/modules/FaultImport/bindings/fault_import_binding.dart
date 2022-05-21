import 'package:get/get.dart';
import 'package:pda/app/data/providers/import_order_provider.dart';

import '../controllers/fault_import_controller.dart';

class FaultImportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaultImportController>(
      () => FaultImportController(),
    );
    Get.lazyPut<ImportOrderProvider>(
      () => ImportOrderProvider(),
    );
  }
}
