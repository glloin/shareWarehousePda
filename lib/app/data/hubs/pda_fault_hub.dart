import 'dart:async';

import 'package:get/get.dart';
import 'package:pda/app/data/hubs/retry_policy.dart';
import 'package:pda/app/data/providers/base_connect_provider.dart';
import 'package:pda/app/global/message.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/itransport.dart';

class PdaFaultHub {
  late final HubConnection hub;

  PdaFaultHub() {
    hub = HubConnectionBuilder()
        .withUrl("${BaseConnectProvider.serviceUrl}/Hubs/PdaFault",
            transportType: HttpTransportType.WebSockets)
        .withAutomaticReconnect(
            reconnectPolicy: RetryPolicy((msg) => errorMsg.value = msg))
        .build();
    hub.on("FaultCanScanChange", (arguments) {
      faultCanScan.value = (arguments![0] == true);
    });
    hub.on("EmptyStockModeChange", (arguments) {
      emptyStockMode.value = (arguments![0] == true);
    });
    hub.start()?.then(_onStart).catchError(onError);
  }

  final errorMsg = Rx<String?>(null);
  final faultCanScan = Rx<bool>(false);
  final emptyStockMode = Rx<bool>(false);
  Future<FutureOr> _onStart(void value) async {
    try {
      emptyStockMode.value = await hub.invoke("EmptyStockMode") == true;
      faultCanScan.value = await hub.invoke("FaultCanScan") == true;
    } catch (e) {
      onError(e);
    }
  }
}
