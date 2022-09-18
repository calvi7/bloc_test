import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_drawer/pages/data/view/data_view.dart';
import 'package:layout_drawer/pages/home/home.dart';
import 'package:layout_drawer/pages/landing/view/landing_view.dart';
import 'package:layout_drawer/pages/not_found/not_found_view.dart';
import 'package:layout_drawer/pages/settings/view/settings_view.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class LayoutRouter {
  static void routeTo(BuildContext context, SelectedView view) {
    context.read<LayoutDrawerBloc>().add(LayoutDrawerChanged(view));
    Navigator.pushReplacementNamed(context, view.routeName);
  }

  static Route router(RouteSettings settings) {
    switch (settings.name) {
      case 'landing':
        return _pageRouteBuilder(settings, const LandingView());
      case 'home':
        return _pageRouteBuilder(settings, const Home());
      case 'settings':
        return _pageRouteBuilder(settings, const SettingsView());
      case 'data':
        return _pageRouteBuilder(settings, const DataView());
      default:
        return _pageRouteBuilder(settings, const NotFoundView());
    }
  }
}

PageRouteBuilder _pageRouteBuilder(RouteSettings settings, Widget route) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => route,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
