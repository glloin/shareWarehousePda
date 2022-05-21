import 'package:get/get.dart';
import 'package:pda/app/data/models/scan_info_model.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';
import 'package:pda/app/data/providers/scan_provider.dart';
import 'package:pda/app/data/providers/import_bill_provider.dart';

class ImportBillController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    ScannerProvider.instance.addListen(_scan);
    Get.find<ImportBillProvider>()
        .getUnFinishiedList()
        .then((value) => datas.value = value);
  }

  final billCode = Rx<String?>(null);
  final stockCode = Rx<String?>(null);
  final datas = Rx<List<ViewImportBill>>([]);

  @override
  void onClose() {
    ScannerProvider.instance.removeListen(_scan);
  }

  void _scan(ScanInfo code) {
    print(code.scanData);
    if (billCode.value == null) {
      billCode.value = code.scanData;
    } else {
      stockCode.value = code.scanData;
    }
  }
}
