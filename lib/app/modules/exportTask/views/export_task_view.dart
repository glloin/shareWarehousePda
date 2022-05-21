import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pda/app/data/models/view_equipment_task_model.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/global/widgets/member_item.dart';

import '../controllers/export_task_controller.dart';

class ExportTaskView extends GetView<ExportTaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('出库任务'),
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
        subtitle: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
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
                Flexible(
                  child: Column(
                    children: [
                      MemberItem(val: d.taskMode.toString(), title: "模式:"),
                      MemberItem(val: d.from ?? "", title: "来源:"),
                      MemberItem(
                          val: d.executeFlag!.toBillExecuteFlag() ?? "",
                          title: "状态:"),
                      MemberItem(val: d.time.toYMDHMS(), title: "时间:"),
                      MemberItem(val: d.stockCode.toString(), title: "缸体码:"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
