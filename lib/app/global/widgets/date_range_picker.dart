import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePicker extends StatefulWidget {
  final void Function(DateTime? start, DateTime? end) onChange;
  final DateTime? start;
  final DateTime? end;
  const DateRangePicker(
      {Key? key, required this.onChange, this.start, this.end})
      : super(key: key);

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime? start;
  DateTime? end;

  @override
  void initState() {
    start = widget.start;
    end = widget.end;
    super.initState();
  }

  void showPicker(BuildContext context) async {
    final data = await showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(
            start: start ?? DateTime.now(), end: end ?? DateTime.now()),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (data != null) {
      setState(() {
        start = data.start;
        end = DateTime.fromMillisecondsSinceEpoch(
            data.end.add(const Duration(days: 1)).millisecondsSinceEpoch - 1);
      });
    } else {
      setState(() {
        start = null;
        end = null;
      });
    }
    widget.onChange(start, end);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: () => showPicker(context),
            child: Text(start != null
                ? DateFormat("yyyy-MM-dd").format(start!)
                : "开始时间")),
        const SizedBox(width: 10),
        const Text("-"),
        const SizedBox(width: 10),
        OutlinedButton(
            onPressed: () => showPicker(context),
            child: Text(
                end != null ? DateFormat("yyyy-MM-dd").format(end!) : "结束时间")),
      ],
    );
  }
}
