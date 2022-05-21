import 'dart:async';

import 'package:get/get.dart';
import 'package:pda/app/data/hubs/retry_policy.dart';
import 'package:pda/app/data/models/notify_import_order_model.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import 'package:pda/app/global/message.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/itransport.dart';

class GlobalHub {
  late final HubConnection hub;
  GlobalHub() {
    hub = HubConnectionBuilder()
        .withUrl("${BaseConnectProvider.serviceUrl}/Hubs/Global",
            transportType: HttpTransportType.WebSockets)
        .withAutomaticReconnect(
            reconnectPolicy: RetryPolicy((msg) => errorMsg.value = msg))
        .build();
    hub.on("ModeChange", (arguments) {
      mode.value = arguments![0] == "Import";
    });
    hub.on("NotifyImportOrderChange", (arguments) {
      if (arguments?[0] != null) {
        notify.value = NotifyImportOrder.fromJson(arguments![0] as dynamic);
      } else {
        notify.value = null;
      }
    });
    hub.start()?.then(_onStart).catchError(onError);
  }

  final errorMsg = Rx<String?>(null);
  final mode = true.obs;
  final notify = Rx<NotifyImportOrder?>(null);
  FutureOr _onStart(void value) async {
    try {
      mode.value = (await hub.invoke("GetMode")) == "Import";
      final d1 = await hub.invoke("getNotifyImportOrder");
      if (d1 != null) {
        notify.value = NotifyImportOrder.fromJson(d1 as dynamic);
      }
    } catch (e) {
      onError(e);
    }
  }

  void switchImport() {
    if (mode.value) {
      return;
    }
    hub
        .invoke("switchMode", args: [1])
        .then((value) => print(value))
        .catchError(onError);
  }

  void switchMode(int index) {
    hub
        .invoke("switchMode", args: [index == 0 ? 1 : 0])
        .then((value) => print(value))
        .catchError(onError);
  }

  void switchExport() {
    if (!mode.value) {
      return;
    }
    hub
        .invoke("switchMode", args: [0])
        .then((value) => print(value))
        .catchError(onError);
  }
}
