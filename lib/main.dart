import 'package:color_generator_app/app.dart';
import 'package:color_generator_app/injection.dart' as di;
import 'package:flutter/material.dart';

void main() async {
  await di.init();

  runApp(const App());
}
