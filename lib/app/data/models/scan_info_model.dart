class ScanInfo {
  late String scanData;
  late String symbology;
  late String dateTime;

  ScanInfo(
      {required this.scanData,
      required this.symbology,
      required this.dateTime});

  ScanInfo.fromJson(Map<String, dynamic> json) {
    scanData = json['scanData'];
    symbology = json['symbology'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['scanData'] = scanData;
    data['symbology'] = symbology;
    data['dateTime'] = dateTime;
    return data;
  }
}
