import 'package:flutter/material.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutDrawer(
        child: Center(
          child: Text("Page not found"),
        ),
      ),
    );
  }
}
