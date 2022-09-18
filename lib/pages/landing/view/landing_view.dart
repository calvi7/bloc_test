import 'package:flutter/material.dart';
import 'package:layout_drawer/utils/layout_router.dart';

import 'package:layout_drawer/widgets/layout_drawer/layout_drawer.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => LayoutRouter.routeTo(context, SelectedView.home),
          child: const Text("Entrar a la App"),
        ),
      ),
    );
  }
}
