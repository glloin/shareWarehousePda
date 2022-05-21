import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/view_import_bill_model.dart';
import 'package:pda/app/data/models/view_import_notify_model.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'bill_info_widget.dart';
import 'notify_widget.dart';

class NotifyListView extends GetView {
  final ViewImportBill data;
  final List<ViewImportNotify> list;
  NotifyListView(this.data, this.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("入库单明细"),
        actions: [const LoginInfoView()],
        centerTitle: false,
      ),
      body: Column(
        children: [
          BillInfoWidget(data: data),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => _dataItem(list[index]),
              itemCount: list.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataItem(ViewImportNotify d) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Card(
        child: ListTile(
          title: Text(d.goodsName!),
          // onTap: () {
          //   Get.find<ImportBillController>().scanStockCode(data, d);
          // },
          subtitle: NotifyWidget(data: d, color: null),
        ),
      ),
    );
  }
}
