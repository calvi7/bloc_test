import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:layout_drawer/utils/layout_drawer_utils.dart';

enum SelectedView { home, settings, about, error, data }

extension Data on SelectedView {
  String get _name => toString().substring(13).toString();
  String get name => _capitalized(_name);
  String get routeName => _name;
  SelectedViewModel get data => SelectedViewModel.fromSelectedView(this);
}

class SelectedViewModel extends Equatable {
  final String routeName;
  final String name;
  final Icon icon;

  const SelectedViewModel({
    required this.routeName,
    required this.name,
    required this.icon,
  });

  factory SelectedViewModel.fromSelectedView(SelectedView view) =>
      SelectedViewModel(
        routeName: view.routeName,
        name: view.name,
        icon: getIcon(view),
      );

  @override
  List<Object?> get props => [routeName, name, icon];
}

String _capitalized(String text) =>
    "${text[0].toUpperCase()}${text.substring(1)}";
