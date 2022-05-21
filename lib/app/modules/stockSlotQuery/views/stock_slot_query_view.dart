import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/data/models/view_stock_slot.dart';
import 'package:pda/app/extensions.dart';
import 'package:pda/app/global/widgets/member_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/stock_slot_query_controller.dart';

class StockSlotQueryView extends GetView<StockSlotQueryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('库存查询'),
          actions: [
            IconButton(
                onPressed: controller.onFilter,
                icon: const Icon(Icons.filter_alt_outlined))
          ],
        ),
        body: Obx(() => SmartRefresher(
              controller: controller.ctl,
              onRefresh: controller.onRefresh,
              enablePullDown: true,
              enablePullUp: true,
              enableTwoLevel: true,
              onLoading: controller.onLoading,
              child: ListView.builder(
                itemBuilder: (c, index) =>
                    _dataBuilder(controller.datas.value[index]),
                itemCount: controller.datas.value.length,
              ),
            )));
  }

  Card _dataBuilder(ViewStockSlot obj) {
    return Card(
      child: ListTile(
        title: Text(obj.goodsName!),
        subtitle: Row(
          children: [
            SizedBox(
              width: 110,
              child: Column(
                children: [
                  MemberItem(title: "库房:", val: obj.warehouseName!),
                  MemberItem(title: "巷道:", val: obj.lanewayName!),
                  MemberItem(title: "储位编码:", val: obj.slotCode!),
                  MemberItem(title: "库存状态:", val: obj.flag!),
                  MemberItem(title: "库存数量:", val: obj.quantity.toString()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  MemberItem(title: "托盘条码:", val: obj.stockCode ?? ''),
                  MemberItem(title: "入库时间:", val: obj.time!.toYMDHMS()),
                  MemberItem(title: "入库单号:", val: obj.billCode ?? ''),
                  MemberItem(title: "入库流水:", val: obj.orderNo ?? ''),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
