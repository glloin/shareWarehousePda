import 'package:get/get.dart';

import '../controllers/export_task_controller.dart';

class ExportTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExportTaskController>(() => ExportTaskController(),
        fenix: true);
  }
}
