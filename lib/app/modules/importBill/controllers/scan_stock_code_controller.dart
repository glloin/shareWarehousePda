import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/scan_info_model.dart';
import 'package:pda/app/data/providers/import_order_provider.dart';
import 'package:pda/app/data/providers/scan_provider.dart';
import 'package:pda/app/global/message.dart';

class ScanStockCodeController extends GetxController {
  late int notifyId;

  @override
  void onInit() {
    super.onInit();
    ScannerProvider.instance.addListen(_scan);
  }

  @override
  void onClose() {
    ScannerProvider.instance.removeListen(_scan);
  }

  void _scan(ScanInfo code) {
    ctl.text = code.scanData;
    addImportOrder();
  }

  final errorMsg = Rx<String?>(null);
  final ctl = TextEditingController();
  final isBusy = false.obs;

  Future addImportOrder() async {
    var code = ctl.text.trim();
    if (code.isEmpty) {
      errorMsg.value = "缸体条码不能为空!";
    } else {
      errorMsg.value = null;
    }
    isBusy.value = true;
    try {
      await (Get.find<ImportOrderProvider>().add(notifyId, code));
      info("入库流水添加成功!");
      ctl.text = "";
    } catch (e) {
      print(e);
      alarm(e.toString());
    } finally {
      isBusy.value = false;
    }
  }
}
