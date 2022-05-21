class PagenationData<T> {
  late List<T> datas;
  int? current;
  int? total;
  int? pageSize;

  PagenationData(
      {required this.datas, this.current, this.total, this.pageSize});

  PagenationData.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) noteFromJson) {
    datas = <T>[];
    if (json['datas'] != null) {
      json['datas'].forEach((v) {
        datas.add(noteFromJson(v));
      });
    }
    current = json['current'];
    total = json['total'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson(
      Map<String, dynamic> Function(T data) noteToJson) {
    final data = <String, dynamic>{};
    data['datas'] = datas.map((v) => noteToJson(v)).toList();
    data['current'] = current;
    data['total'] = total;
    data['pageSize'] = pageSize;
    return data;
  }
}
