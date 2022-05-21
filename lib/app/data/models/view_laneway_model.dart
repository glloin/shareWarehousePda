class ViewLaneway {
  int? id;
  String? name;
  int? no;
  String? stackerName;
  String? status;
  String? warehouseName;
  int? emptySlotCount;
  double? stockQuantity;

  ViewLaneway(
      {this.id,
      this.name,
      this.no,
      this.stackerName,
      this.status,
      this.warehouseName,
      this.emptySlotCount,
      this.stockQuantity});

  ViewLaneway.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    no = json['no'];
    stackerName = json['stackerName'];
    status = json['status'];
    warehouseName = json['warehouseName'];
    emptySlotCount = json['emptySlotCount'];
    stockQuantity = json['stockQuantity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['no'] = no;
    data['stackerName'] = stackerName;
    data['status'] = status;
    data['warehouseName'] = warehouseName;
    data['emptySlotCount'] = emptySlotCount;
    data['stockQuantity'] = stockQuantity;
    return data;
  }
}
