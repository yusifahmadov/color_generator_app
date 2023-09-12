import 'dart:ui';

import 'package:color_generator_app/core/response/responsei.dart';
import 'package:color_generator_app/features/color/data/datasources/color_local_data_source.dart';
import 'package:color_generator_app/features/color/domain/repositories/color_repository.dart';
import 'package:dartz/dartz.dart';

class ColorRepositoryImpl implements ColorRepository {
  final ColorLocalDataSource _colorLocalDataSource;

  ColorRepositoryImpl(this._colorLocalDataSource);
  @override
  Future<Either<ResponseI, Color>> getRandomColor() async {
    try {
      return Right(await _colorLocalDataSource.getRandomColor());
    } catch (e) {
      return Left(ResponseI(message: e.toString()));
    }
  }
}
