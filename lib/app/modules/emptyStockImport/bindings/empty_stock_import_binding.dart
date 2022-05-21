import 'package:get/get.dart';
import 'package:pda/app/data/providers/equipment_task_provider.dart';

import '../controllers/empty_stock_import_controller.dart';

class EmptyStockImportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmptyStockImportController>(() => EmptyStockImportController(),
        fenix: true);
    Get.lazyPut<EquipmentTaskProvider>(() => EquipmentTaskProvider(),
        fenix: true);
  }
}
