import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';

import '../controllers/empty_stock_import_controller.dart';

class EmptyStockImportView extends GetView<EmptyStockImportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('空托盘入库'),
        actions: [const LoginInfoView()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 24.0, top: 48.0, bottom: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    '托盘条码:',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(() => TextField(
                          controller: controller.stockCodeCtl,
                          decoration: InputDecoration(
                              hintText: "请输入托盘条码!",
                              errorText: controller.stockCodeErrorMsg.value),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    '入库数量:',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(() => TextField(
                          controller: controller.quantityCtl,
                          decoration: InputDecoration(
                              hintText: "请输入入库数量!",
                              errorText: controller.quantityErrorMsg.value),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Obx(() => OutlinedButton(
                  onPressed: (controller.stockCodeErrorMsg.value == null &&
                          controller.quantityErrorMsg.value == null)
                      ? controller.onSubmit
                      : null,
                  child: const Text("确定")))
            ],
          ),
        ),
      ),
    );
  }
}
