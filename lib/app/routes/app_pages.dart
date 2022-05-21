import 'package:get/get.dart';

import '../modules/FaultImport/bindings/fault_import_binding.dart';
import '../modules/FaultImport/views/fault_import_view.dart';
import '../modules/emptyStockImport/bindings/empty_stock_import_binding.dart';
import '../modules/emptyStockImport/views/empty_stock_import_view.dart';
import '../modules/exportBill/bindings/export_bill_binding.dart';
import '../modules/exportBill/views/export_bill_view.dart';
import '../modules/exportOrder/bindings/export_order_binding.dart';
import '../modules/exportOrder/views/export_order_view.dart';
import '../modules/exportTask/bindings/export_task_binding.dart';
import '../modules/exportTask/views/export_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/importBill/bindings/import_bill_binding.dart';
import '../modules/importBill/views/import_bill_view.dart';
import '../modules/importOrder/bindings/import_order_binding.dart';
import '../modules/importOrder/views/import_order_view.dart';
import '../modules/importTask/bindings/import_task_binding.dart';
import '../modules/importTask/views/import_task_view.dart';
import '../modules/lanewayManager/bindings/laneway_manager_binding.dart';
import '../modules/lanewayManager/views/laneway_manager_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/qualityManager/bindings/quality_manager_binding.dart';
import '../modules/qualityManager/views/quality_manager_view.dart';
import '../modules/stockSlotQuery/bindings/stock_slot_query_binding.dart';
import '../modules/stockSlotQuery/views/stock_slot_query_view.dart';
import '../modules/systemSettings/bindings/system_settings_binding.dart';
import '../modules/systemSettings/views/system_settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.IMPORT_BILL,
      page: () => ImportBillView(),
      binding: ImportBillBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.IMPORT_ORDER,
      page: () => ImportOrderView(),
      binding: ImportOrderBinding(),
    ),
    GetPage(
      name: _Paths.STOCK_SLOT_QUERY,
      page: () => StockSlotQueryView(),
      binding: StockSlotQueryBinding(),
    ),
    GetPage(
      name: _Paths.QUALITY_MANAGER,
      page: () => QualityManagerView(),
      binding: QualityManagerBinding(),
      children: [
        GetPage(
          name: _Paths.QUALITY_MANAGER,
          page: () => QualityManagerView(),
          binding: QualityManagerBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.IMPORT_TASK,
      page: () => ImportTaskView(),
      binding: ImportTaskBinding(),
    ),
    GetPage(
      name: _Paths.EXPORT_BILL,
      page: () => ExportBillView(),
      binding: ExportBillBinding(),
    ),
    GetPage(
      name: _Paths.EXPORT_ORDER,
      page: () => ExportOrderView(),
      binding: ExportOrderBinding(),
    ),
    GetPage(
      name: _Paths.EXPORT_TASK,
      page: () => ExportTaskView(),
      binding: ExportTaskBinding(),
    ),
    GetPage(
      name: _Paths.LANEWAY_MANAGER,
      page: () => LanewayManagerView(),
      binding: LanewayManagerBinding(),
    ),
    GetPage(
      name: _Paths.SYSTEM_SETTINGS,
      page: () => SystemSettingsView(),
      binding: SystemSettingsBinding(),
    ),
    GetPage(
      name: _Paths.EMPTY_STOCK_IMPORT,
      page: () => EmptyStockImportView(),
      binding: EmptyStockImportBinding(),
    ),
    GetPage(
      name: _Paths.FAULT_IMPORT,
      page: () => FaultImportView(),
      binding: FaultImportBinding(),
    ),
  ];
}
