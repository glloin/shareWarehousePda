import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import '../controllers/fault_import_controller.dart';

class FaultImportView extends GetView<FaultImportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("手动入库"),
        actions: [const LoginInfoView()],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _item(
                "缸体号:",
                _itemInput(Obx(() => TextField(
                      controller: controller.ctl,
                      decoration: InputDecoration(
                          hintText: "请输入或扫描缸体号!",
                          errorText: controller.errorMsg.value),
                      keyboardType: TextInputType.number,
                      onEditingComplete: controller.onSubmit,
                    )))),
            const SizedBox(height: 24),
            Obx(() => OutlinedButton(
                onPressed: controller.pdaFaultHub.faultCanScan.value
                    ? controller.onSubmit
                    : null,
                child: const Text("缸体入库"))),
            const SizedBox(height: 24),
            Obx(() => Column(
                  children: [
                    ToggleButtons(
                      onPressed: controller.writeEmptyStockSwitchMode,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 0, bottom: 0),
                          child: Text("机械臂入库"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 0, bottom: 0),
                          child: Text("空托盘出库"),
                        )
                      ],
                      isSelected: [
                        !controller.pdaFaultHub.emptyStockMode.value,
                        controller.pdaFaultHub.emptyStockMode.value
                      ],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Expanded _itemInput(Widget child) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: child,
    ));
  }

  Row _item(String title, Widget child) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          child: Text(title),
          width: 80,
        ),
        child
      ],
    );
  }
}
