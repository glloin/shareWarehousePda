import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda/app/global/widgets/login_info_view.dart';
import 'package:pda/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Widget _cardItem(
        IconData iconData, String icontitle, void Function()? onTap) {
      return Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 48,
                color: Colors.blue,
              ),
              Text(
                icontitle,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.home_outlined),
            const Text("主页"),
          ],
        ),
        actions: [const LoginInfoView()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          children: [
            _cardItem(Icons.receipt_outlined, "入库单", controller.toImportBill),
            _cardItem(Icons.reorder_outlined, "入库流水", controller.toImportOrder),
            _cardItem(Icons.task_outlined, "入库任务",
                () => Get.toNamed(Routes.IMPORT_TASK)),
            _cardItem(Icons.receipt_long, "出库单",
                () => Get.toNamed(Routes.EXPORT_BILL)),
            _cardItem(Icons.toc_outlined, "出库流水",
                () => Get.toNamed(Routes.EXPORT_ORDER)),
            _cardItem(
                Icons.task_alt, "出库任务", () => Get.toNamed(Routes.EXPORT_TASK)),
            _cardItem(Icons.nearby_error_outlined, "手动入库",
                () => Get.toNamed(Routes.FAULT_IMPORT)),
            _cardItem(
                Icons.search_outlined, "库存查询", controller.toStockSlotQuery),
            // _cardItem(Icons.high_quality, "品质管理",
            //     () => Get.toNamed(Routes.QUALITY_MANAGER)),
            // _cardItem(Icons.storage, "巷道管理",
            //     () => Get.toNamed(Routes.LANEWAY_MANAGER)),
            // _cardItem(Icons.inventory_2_outlined, "空托盘入库",
            //     () => Get.toNamed(Routes.EMPTY_STOCK_IMPORT)),
            // _cardItem(Icons.settings_outlined, "系统设置",
            //     () => Get.toNamed(Routes.SYSTEM_SETTINGS)),
          ],
        ),
      ),
    );
  }
}
