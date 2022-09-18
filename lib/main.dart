import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout_drawer/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const App());
}
