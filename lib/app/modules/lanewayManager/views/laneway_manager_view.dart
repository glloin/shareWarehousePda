import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pda/app/data/models/view_laneway_model.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';

import '../controllers/laneway_manager_controller.dart';

class LanewayManagerView extends GetView<LanewayManagerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('巷道管理'),
        actions: [const LoginInfoView()],
      ),
      body: Obx(() => ListView.builder(
            itemBuilder: (c, i) => _dataItem(controller.hub.datas.value[i]),
            itemCount: controller.hub.datas.value.length,
          )),
    );
  }

  Widget _dataItem(ViewLaneway d) {
    return Card(
      child: ListTile(
        title: Text(d.name!),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  _memberItem(d.warehouseName ?? "", "库房:"),
                  _memberItem(d.stackerName ?? "", "堆垛机:"),
                ],
              ),
            ),
            SizedBox(
              width: 70,
              child: Column(
                children: [
                  _memberItem((d.no ?? "").toString(), "No:"),
                  _memberItem(d.status ?? "", "状态:"),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _memberItem(d.emptySlotCount!.toString(), "空储位:"),
                  _memberItem(d.stockQuantity!.toString(), "库存数量:"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _memberItem(String val, String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 8),
        ),
        Expanded(
          child: Text(
            val,
            style: const TextStyle(color: Colors.blue, fontSize: 8),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
