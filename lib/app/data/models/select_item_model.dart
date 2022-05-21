class SelectItem {
  int? value;
  String? label;

  SelectItem({this.value, this.label});

  SelectItem.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}
