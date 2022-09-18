import 'package:flutter/material.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class ScaffoldedLayout extends StatelessWidget {
  const ScaffoldedLayout({
    Key? key,
    required this.child,
    this.appBar,
  }) : super(key: key);

  final Widget child;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: LayoutDrawer(child: child),
    );
  }
}
