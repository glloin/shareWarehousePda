import 'package:get/get.dart';
import 'package:pda/app/data/models/view_export_order_model.dart';
import 'package:pda/app/data/providers/export_order_provider.dart';
import 'package:pda/app/global/message.dart';

class ExportOrderController extends GetxController {
  @override
  void onInit() {
    Get.find<ExportOrderProvider>()
        .getUnFinishiedList()
        .then((value) => datas.value = value)
        .catchError(onError);
    super.onInit();
  }

  final datas = Rx<List<ViewExportOrder>>([]);
}
