import 'package:get/get.dart';
import 'package:pda/app/data/hubs/equipment_task_hub.dart';
import 'package:pda/app/extensions.dart';

class ExportTaskController extends GetxController {
  late EquipmentTaskHub hub;

  @override
  void onInit() {
    hub = EquipmentTaskHub((v) => v.isExportTask(), "Export");
    super.onInit();
  }

  @override
  void onClose() {
    hub.hub.stop();
    super.onClose();
  }
}
