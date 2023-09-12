import 'dart:math';

import 'package:flutter/material.dart';

/// [ColorLocalDataSource] - contains abstract functions about color
abstract class ColorLocalDataSource {
  /// [getRandomColor] - is used to generate random color and pass to repository
  Future<Color> getRandomColor();
}

/// Contains functions that overriden from [ColorLocalDataSource]
class ColorLocalDataSourceImpl implements ColorLocalDataSource {
  @override
  Future<Color> getRandomColor() async {
    const max2 = 255;

    return Color.fromARGB(
      Random().nextInt(max2),
      Random().nextInt(max2),
      Random().nextInt(max2),
      Random().nextInt(max2),
    );
  }
}
