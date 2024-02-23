import 'package:flutter/material.dart';

enum DividerEnum { horizontal, vertical }

class MDivider extends StatelessWidget {
  final Color? color;
  final DividerEnum direction;
  const MDivider({
    this.direction = DividerEnum.horizontal,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isHorizontal = direction == DividerEnum.horizontal;
    return Container(
      height: isHorizontal ? 1 : double.maxFinite,
      width: isHorizontal ? double.maxFinite : 1,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onPrimary.withOpacity(.2),
      ),
    );
  }
}
