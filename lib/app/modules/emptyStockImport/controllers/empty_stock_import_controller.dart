import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/providers/equipment_task_provider.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/message.dart';

class EmptyStockImportController extends GetxController {
  final stockCodeCtl = TextEditingController();
  final quantityCtl = TextEditingController(text: "1");

  final stockCodeErrorMsg = Rx<String?>("请输入托盘条码!");
  final quantityErrorMsg = Rx<String?>(null);

  void stockValidity() {
    stockCodeErrorMsg.value = stockCodeCtl.text.isStockCode();
  }

  void quantityValidity() {
    if (int.tryParse(quantityCtl.text) != null) {
      quantityErrorMsg.value = null;
    } else {
      quantityErrorMsg.value = "数量必须是整数!";
    }
  }

  void onSubmit() {
    Get.find<EquipmentTaskProvider>()
        .emptyStockImport(stockCodeCtl.text, int.tryParse(quantityCtl.text)!)
        .then((value) {
      if (value) {
        Get.back();
        return;
      }
      throw "接口调用失败!";
    }).catchError(onError);
  }

  @override
  void onInit() {
    stockCodeCtl.addListener(stockValidity);
    quantityCtl.addListener(quantityValidity);
    super.onInit();
  }

  @override
  void onClose() {
    stockCodeCtl.removeListener(stockValidity);
    quantityCtl.removeListener(quantityValidity);
    super.onClose();
  }

  @override
  void dispose() {
    stockCodeCtl.dispose();
    quantityCtl.dispose();
    super.dispose();
  }
}
