import 'package:color_generator_app/app.dart';
import 'package:flutter/material.dart';

import 'injection.dart' as di;

void main() async {
  await di.init();

  runApp(const App());
}
