import 'package:flutter/material.dart';

class CustomScrollConfig extends StatelessWidget {
  final Widget child;
  const CustomScrollConfig({required this.child });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return false;
      },
      child: child,
    );
  }
}