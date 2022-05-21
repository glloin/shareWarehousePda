import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/hubs/pda_fault_hub.dart';
import 'package:pda/app/data/models/scan_info_model.dart';
import 'package:pda/app/data/providers/import_order_provider.dart';
import 'package:pda/app/data/providers/scan_provider.dart';
import 'package:pda/app/global/message.dart';

class FaultImportController extends GetxController {
  final ctl = TextEditingController();
  final errorMsg = Rx<String?>(null);
  late final PdaFaultHub pdaFaultHub;
  @override
  void onInit() {
    super.onInit();
    pdaFaultHub = PdaFaultHub();
    ScannerProvider.instance.addListen(_scan);
    pdaFaultHub.hub.start();
  }

  @override
  void onClose() {
    ScannerProvider.instance.removeListen(_scan);
    pdaFaultHub.hub.stop();
  }

  void _scan(ScanInfo code) {
    ctl.text = code.scanData;
  }

  Future onSubmit() async {
    if (!pdaFaultHub.faultCanScan.value) {
      return;
    }
    try {
      final stockCode = ctl.text;
      if (stockCode.isEmpty) throw "缸体码不能为空!";
      validateStockCode(stockCode);
      await Get.find<ImportOrderProvider>().faultImport(ctl.text);
      ctl.clear();
      info("入库任务关联成功!");
    } catch (e) {
      alarm(e.toString());
    }
  }

  void validateStockCode(String stockCode) {
    var datas = stockCode.split('^');
    if (datas.length != 2) {
      throw "二维码异常,分割出的二维码与约定不匹配。必须只有两个元素";
    }
    if (!(datas[1].length >= 14)) {
      throw "二维码异常,二维码第二个元素字符串长度必须大于等于14,当前长度:{datas[1].Length}";
    }
    // var goodsCode = datas[0];
    // var supplierCode = datas[1].substring(0, 4);
    // var orderNo = datas[1].substring(4, 10);
    // var other = datas[1].substring(14);
  }

  Future onSupplyEmptyStock() async {
    try {
      await pdaFaultHub.hub.invoke("SupplyEmptyStock");
    } catch (e) {
      alarm(e.toString());
    }
  }

  Future writeEmptyStockSwitchMode(int v1) async {
    try {
      await pdaFaultHub.hub.invoke("WriteEmptyStockSwitchMode", args: [v1]);
    } catch (e) {
      alarm(e.toString());
    }
  }
}
