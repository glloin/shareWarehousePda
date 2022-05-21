import 'package:get/get.dart';
import 'package:pda/app/data/models/view_export_bill_model.dart';
import 'package:pda/app/data/providers/export_bill_provider.dart';
import 'package:pda/app/global/message.dart';

class ExportBillController extends GetxController {
  @override
  void onInit() {
    Get.find<ExportBillProvider>()
        .getUnFinishiedList()
        .then((value) => datas.value = value)
        .catchError(onError);
    super.onInit();
  }

  final datas = Rx<List<ViewExportBill>>([]);
}
