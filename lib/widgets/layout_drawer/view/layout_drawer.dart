import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_drawer/utils/layout_drawer_utils.dart';
import 'package:layout_drawer/utils/layout_router.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class LayoutDrawer extends StatelessWidget {
  final Widget child;

  const LayoutDrawer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutDrawerBloc, LayoutDrawerState>(
      builder: (context, state) {
        double width = state is LayoutDrawerExpanded ? 150 : 50;
        return Stack(
          children: [
            child,
            Positioned(
              left: 0,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Theme.of(context).drawerTheme.backgroundColor,
                ),
                duration: const Duration(milliseconds: 150),
                width: width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: SelectedView.values.length,
                      itemBuilder: (context, index) {
                        var item = SelectedView.values[index];
                        if (item == SelectedView.error) {
                          return Container();
                        }
                        return ViewButton(view: SelectedView.values[index]);
                      },
                    ),
                    const ToggleButton()
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ViewButton extends StatelessWidget {
  const ViewButton({
    super.key,
    required this.view,
  });

  final SelectedView view;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutDrawerBloc, LayoutDrawerState>(
      builder: (context, state) {
        return TextButton(
          onPressed: state.view == view
              ? null
              : () => LayoutRouter.routeTo(context, view),
          child:
              state is LayoutDrawerExpanded ? Text(view.name) : view.data.icon,
        );
      },
    );
  }
}

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutDrawerBloc, LayoutDrawerState>(
      builder: (context, state) {
        var inside = state is LayoutDrawerExpanded ? '<<' : '>>';
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => LayoutDrawerController.toggle(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: double.infinity,
              height: 30,
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: Center(child: Text(inside)),
            ),
          ),
        );
      },
    );
  }
}
