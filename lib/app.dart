import 'package:color_generator_app/features/color/presentation/pages/color_page_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ColorPageView());
  }
}
