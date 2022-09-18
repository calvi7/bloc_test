import 'package:flutter/material.dart';
import 'package:layout_drawer/utils/layout_drawer_utils.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldedLayout(
        child: Center(
      child: TextButton(
        onPressed: () => LayoutDrawerController.toggle(context),
        child: const Text("Toggle Layout jajaja"),
      ),
    ));
  }
}
