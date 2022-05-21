import 'package:decimal/decimal.dart';

extension DateTimeExtensions on DateTime {
  toYMDHMS() {
    return "$year-${nf(month)}-${nf(day)} ${nf(hour)}:${nf(minute)}:${nf(second)}";
  }

  toYMD() {
    return "$year-${nf(month)}-${nf(day)}";
  }
}

nf(int num) {
  return num > 9 ? num : '0$num';
}

extension IntExtensions on int {
  toYMDHMS() {
    return DateTime.fromMillisecondsSinceEpoch(this).toYMDHMS();
  }

  toYMD() {
    return DateTime.fromMillisecondsSinceEpoch(this).toYMD();
  }
}

extension IntNullableExtensions on int? {
  toDateTime() {
    if (this == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(this!);
  }

  toYMDHMS() {
    if (this == null) return null;
    return this!.toYMDHMS();
  }
}

extension StringExtensions on String {
  toBillExecuteFlag() {
    if (this == "Cancel") return "已取消";
    if (this == "WaitingExecute") return "待执行";
    if (this == "Executing") return "执行中";
    if (this == "Finished") return "已完成";
    return "未知";
  }

  toGoodsStatus() {
    if (this == "UnChecked") return "待检";
    if (this == "Qualified") return "合格";
    if (this == "Disqualified") return "不合格";
    return "未知";
  }

  toOrderExecuteFlag() {
    if (this == "Cancel") return "已取消";
    if (this == "WaitingExecute") return "待执行";
    if (this == "Executing") return "执行中";
    if (this == "Finished") return "已完成";
    return "未知";
  }

  String? isImportBillCode() {
    if (length != 17) {
      return "入库单长度不符合规则!";
    }
    if (!RegExp(r"^RKS\d{14}$").hasMatch(this)) {
      return "入库单格式不正确!";
    }
    return null;
  }

  String? isSlotCode() {
    if (length != 8) {
      return "储位编码必须是8位!";
    }
    if (!RegExp(r"^[\d]{8}$").hasMatch(this)) {
      return "储位编码格式不正确!";
    }
    return null;
  }

  String? isStockCode() {
    if (length != 6) {
      return "托盘条码必须是6位!";
    }
    if (!RegExp(r"^[\d]{6}$").hasMatch(this)) {
      return "托盘条码格式不正确!";
    }
    return null;
  }

  Decimal toDecimal() {
    return Decimal.parse(this);
  }

  bool isImportTask() {
    return contains("Import");
  }

  bool isExportTask() {
    return contains("Export");
  }
}
