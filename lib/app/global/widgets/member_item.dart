import 'package:flutter/material.dart';

class MemberItem extends StatelessWidget {
  final String title;
  final String val;
  final Color? color;
  MemberItem({Key? key, required this.title, required this.val, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, right: 4),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontSize: 11),
          ),
          const SizedBox(width: 2),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                val,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: color, fontSize: 11),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
