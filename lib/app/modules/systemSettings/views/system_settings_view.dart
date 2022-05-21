import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/modules/systemSettings/views/auto_import_view.dart';
import '../controllers/system_settings_controller.dart';

class SystemSettingsView extends GetView<SystemSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('系统设置'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => ToggleButtons(
                onPressed: controller.hub.switchMode,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                    child: Text("入库模式"),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                    child: Text("出库模式"),
                  )
                ],
                isSelected: [
                  controller.hub.mode.value,
                  !controller.hub.mode.value
                ],
                selectedColor: Colors.white,
                fillColor: Colors.blue,
              )),
          const SizedBox(height: 24),
          const Divider(),
          Obx(() {
            if (controller.hub.notify.value == null) {
              return _importModeInfo(
                  "手动模式", const Text("手动添加入库流水，通过系统的操作界面来绑定入库单明细和托盘条码的关系"));
            } else {
              final d = controller.hub.notify.value!;
              return _importModeInfo(
                  "自动模式",
                  Column(
                    children: [
                      Text("自动生成入库单号为${d.billCode} 物料名称为${d.goodsName}的入库流水!"),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text("下发数量/计划数量:"),
                          Text(
                            d.factQuantity.toString(),
                            style: const TextStyle(color: Colors.purple),
                          ),
                          const Text("/"),
                          Text(d.quantity.toString(),
                              style: const TextStyle(color: Colors.blue)),
                        ],
                      )
                    ],
                  ));
            }
          })
        ],
      ),
    );
  }

  Widget _importModeInfo(String title, Widget child) {
    return InkWell(
      onTap: () {
        Get.to(AutoImportView());
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
