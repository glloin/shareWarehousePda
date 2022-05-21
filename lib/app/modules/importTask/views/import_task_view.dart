import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/view_equipment_task_model.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/global/widgets/member_item.dart';
import '../controllers/import_task_controller.dart';

class ImportTaskView extends GetView<ImportTaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('入库任务'),
        actions: [const LoginInfoView()],
      ),
      body: Obx(() => ListView.builder(
            itemBuilder: (c, i) => _dataItem(controller.hub.datas.value[i]),
            itemCount: controller.hub.datas.value.length,
          )),
    );
  }

  Widget _dataItem(ViewEquipmentTask d) {
    return Card(
      child: ListTile(
        title: Text(d.taskNo!),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                children: [
                  MemberItem(val: d.goodsInfo ?? "", title: "物品信息"),
                  MemberItem(val: d.taskMode.toString(), title: "任务模式:"),
                  MemberItem(val: d.from ?? "", title: "任务来源:"),
                  MemberItem(
                      val: d.executeFlag!.toBillExecuteFlag() ?? "",
                      title: "执行状态:"),
                  MemberItem(val: d.time.toYMDHMS(), title: "时间:"),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  MemberItem(val: d.warehouseName ?? "", title: "仓库:"),
                  MemberItem(val: d.lanewayName ?? "", title: "巷道:"),
                  MemberItem(val: (d.row ?? "").toString(), title: "排:"),
                  MemberItem(val: (d.column ?? "").toString(), title: "列:"),
                  MemberItem(val: (d.layer ?? "").toString(), title: "层:"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
