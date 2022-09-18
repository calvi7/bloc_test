import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_drawer/widgets/widgets.dart';

Icon getIcon(SelectedView view) {
  switch (view) {
    case SelectedView.home:
      return const Icon(Icons.home);
    case SelectedView.settings:
      return const Icon(Icons.settings);
    case SelectedView.about:
      return const Icon(Icons.contact_mail);
    case SelectedView.data:
      return const Icon(Icons.data_array);
    default:
      return const Icon(Icons.question_mark);
  }
}

class LayoutDrawerController {
  static void toggle(BuildContext context) {
    context.read<LayoutDrawerBloc>().add(LayoutDrawerToggled());
  }
}
