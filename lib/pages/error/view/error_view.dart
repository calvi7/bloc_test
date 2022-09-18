import 'package:flutter/material.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutDrawer(child: Container()),
    );
  }
}
