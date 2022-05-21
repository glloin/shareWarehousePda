import 'package:get/get.dart';
import 'package:pda/app/data/providers/goods_provider.dart';

import 'package:pda/app/data/providers/stock_slot_provider.dart';
import 'package:pda/app/modules/stockSlotQuery/controllers/query_filter_controller.dart';

import '../controllers/stock_slot_query_controller.dart';

class StockSlotQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QueryFilterController>(() => QueryFilterController(),
        fenix: true);
    Get.lazyPut<QueryFilterController>(() => QueryFilterController(),
        fenix: true);
    Get.lazyPut<StockSlotQueryController>(() => StockSlotQueryController(),
        fenix: true);
    Get.lazyPut<StockSlotProvider>(() => StockSlotProvider(), fenix: true);
    Get.lazyPut<GoodsProvider>(() => GoodsProvider(), fenix: true);
  }
}
