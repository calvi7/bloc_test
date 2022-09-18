import 'package:flutter/material.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldedLayout(
      child: Scaffold(
        appBar: AppBar(
          primary: false,
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            tabs: const [
              Tab(text: "View 1"),
              Tab(text: "View 2"),
              Tab(text: "View 3"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: const [
            View(title: "View 1"),
            View(title: "View 2"),
            View(title: "View 3"),
          ],
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
  const View({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
