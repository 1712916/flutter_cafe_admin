import 'package:flutter/material.dart';

class IconAndTitleWidget extends StatelessWidget {
  const IconAndTitleWidget({
    super.key,
    this.iconSize = 16,
    this.iconAndTitleSpace = 16,
    required this.title,
    required this.icon,
    this.tailSize,
    this.tail,
  });

  final double iconSize;
  final Widget icon;
  final double iconAndTitleSpace;
  final Widget title;
  final double? tailSize;
  final Widget? tail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: FittedBox(child: icon),
        ),
        SizedBox(width: iconAndTitleSpace),
        Expanded(child: title),
        tail ?? const SizedBox(),
      ],
    );
  }
}
