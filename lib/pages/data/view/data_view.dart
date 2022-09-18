import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class DataView extends StatelessWidget {
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldedLayout(
      child: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Data data data data"),
              TextButton(
                onPressed: () => Scaffold.of(context).showBottomSheet(
                  (context) => const _AnimatedBottomSheet(),
                ),
                child: const Text("Open Bottom Sheet"),
              )
            ],
          ),
        );
      }),
    );
  }
}

class _AnimatedBottomSheet extends StatefulWidget {
  const _AnimatedBottomSheet({super.key});

  @override
  State<_AnimatedBottomSheet> createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<_AnimatedBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showSecond = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      onClosing: () => setState(() => _showSecond = false),
      enableDrag: false,
      elevation: 0,
      builder: (context) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: AnimatedCrossFade(
          firstChild: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height - 200,
            ),
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  setState(() => _showSecond = true);
                },
                child: const Text("Pay"),
              ),
            ),
          ),
          secondChild: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height / 3,
            ),
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text("Dismiss"),
              ),
            ),
          ),
          crossFadeState: _showSecond
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ),
      animationController: _controller,
      onDragStart: (details) => _controller.repeat(),
    );
  }
}
